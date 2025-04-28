using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;
using Ink.Runtime;

public class dialogManager : MonoBehaviour
{
    [Header("Params")]
    [SerializeField] private float letterTypeSpeed;
    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private TextMeshProUGUI displayName;
    [SerializeField] private Animator portraitAnimator;
    [Header("Choices UI")]
    [SerializeField] private GameObject[] choices;
    private TextMeshProUGUI[] choicesText;
    [Header("Audio")]
    //[SerializeField] private AudioClip[] dialogTypeSndClips;
    //[Range(1, 10)]
    //[SerializeField] private int frequencyLvl = 2;
    //[Range(-2, 2)]
    //[SerializeField] private float minPitch = 0.5f;
    //[Range(-2, 2)]
    //[SerializeField] private float maxPitch = 1.4f;
    //[SerializeField] private bool stopAudio;
    [SerializeField] private dialogAudioInfoSO defaultAudioINFO;
    [SerializeField] private dialogAudioInfoSO[] audioInfos;
    [SerializeField] private bool makePredictable;
    private dialogAudioInfoSO currentAudioINFO;
    private Dictionary<string, dialogAudioInfoSO> audioInfoDictionary;
    private AudioSource audioSrc;

    private Story currentStory;
    public bool dialogueIsPlaying { get; private set; }
    private Coroutine displayLineCoroutine;
    private bool canContiToNextLine = false;
    private static dialogManager instance;

    // holds tags that are used in the INK files
    private const string tagSpeaker = "speaker";
    private const string tagPortrait = "portrait";
    private const string tagLayout = "layout";
    private const string tagAudio = "voice";

    private void Awake()
    {
        if (instance == null)
        {
            Debug.LogWarning("There is already a Dialog Manager in the scene.");
        }
        instance = this;

        audioSrc = this.gameObject.AddComponent<AudioSource>();
        currentAudioINFO = defaultAudioINFO;
    }

    public static dialogManager GetInstance()
    {
        return instance;
    }

    private void Start()//dialogue window is off at start of game
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);

        choicesText = new TextMeshProUGUI[choices.Length];//getting all the text choices into an array
        int index = 0;
        foreach (GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
        InitializeAudioDictionary();
    }

    private void InitializeAudioDictionary()
    {
        audioInfoDictionary = new Dictionary<string, dialogAudioInfoSO>();
        audioInfoDictionary.Add(defaultAudioINFO.id, defaultAudioINFO);
        foreach (dialogAudioInfoSO audioInfo in audioInfos)
        {
            audioInfoDictionary.Add(audioInfo.id, audioInfo);
        }
    }

    private void setCurrentAudioInfo(string id)
    {
        dialogAudioInfoSO audioInfo = null;
        audioInfoDictionary.TryGetValue(id, out audioInfo);
        if (audioInfo != null)
        {
            this.currentAudioINFO = audioInfo;
        }
        else
        {
            Debug.LogWarning("FAILURE TO FIND AUDIO INFO FOR ID : " + id);
        }
    }

    private void Update()
    {
        if (!dialogueIsPlaying)//return if dialogue is not playing
        {
            return;
        }
        if (canContiToNextLine && InputManager.GetInstance().GetSubmitPressed())//handles continuing to next line in the dialogue when the submit is pressed
        {
            ContinueStory();
        }
    }

    public void EnterDialogueMode(TextAsset inkJSON)//plays an ink file with dialogue
    {
        currentStory = new Story(inkJSON.text);
        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);

        displayName.text = "???";
        portraitAnimator.Play("default");

        ContinueStory();
    }

    private void ExitDialogueMode()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        dialogueText.text = "";
        //return to default audio
        setCurrentAudioInfo(defaultAudioINFO.id);
    }

    private void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            if (displayLineCoroutine != null)
            {
                StopCoroutine(displayLineCoroutine);
            }
            //dialogueText.text = currentStory.Continue();//text is dispalyed for currrent dialogue line
            string nextLine = currentStory.Continue();
            HandleTags(currentStory.currentTags);
            displayLineCoroutine = StartCoroutine(DisplayLine(nextLine));
            //DisplayChoices();//if any choices are avalaible, they will be displayed

        }
        else
        {
            ExitDialogueMode();
        }
    }

    private IEnumerator DisplayLine(string line)
    {
        dialogueText.text = line;//clear the dialog text so previous line is not showing
        dialogueText.maxVisibleCharacters = 0;
        canContiToNextLine = false;
        HideChoices();

        foreach (char letter in line.ToCharArray())
        {
            if (InputManager.GetInstance().GetSubmitPressed())
            {
                dialogueText.text = line;
                break;
            }
            //displays the letters one after the other
            //dialogueText.text += letter;//adds a letter to dialog text
            PlayDialogSound(dialogueText.maxVisibleCharacters, dialogueText.text[dialogueText.maxVisibleCharacters]);
            dialogueText.maxVisibleCharacters++;
            yield return new WaitForSeconds(letterTypeSpeed);//waits some time before printing new letter
        }
        DisplayChoices();//if any choices are avalaible, they will be displayed
        canContiToNextLine = true;
    }

    private void PlayDialogSound(int currentDisplayedCharacterCount, char currentCharacter)
    {
        AudioClip[] dialogTypeSndClips = currentAudioINFO.dialogTypeSndClips;
        int frequencyLvl = currentAudioINFO.frequencyLvl;
        float minPitch = currentAudioINFO.minPitch;
        float maxPitch = currentAudioINFO.maxPitch;
        bool stopAudio = currentAudioINFO.stopAudio;
        // plays sound based on teh configuration
        if (currentDisplayedCharacterCount % frequencyLvl == 0)
        {
            if (stopAudio)
            {
                audioSrc.Stop();
            }

            AudioClip soundClip = null;
            if (makePredictable)
            {
                // sound clips
                int hashCode = currentCharacter.GetHashCode();
                int predictableIndex = hashCode % dialogTypeSndClips.Length;
                soundClip = dialogTypeSndClips[predictableIndex];
                //setting up pitches for clips
                int minPitchINT = (int)(minPitch * 100);
                int maxPitchINT = (int)(maxPitch * 100);
                int pitchRangeINT = maxPitchINT - minPitchINT;
                //will skip the selection if it not divisiable by zero and no range available
                if (pitchRangeINT != 0)
                {
                    int predictablePitchINT = (hashCode % pitchRangeINT) + minPitchINT;
                    float predictablePitch = predictablePitchINT / 100f;
                    audioSrc.pitch = predictablePitch;
                } else
                {
                    audioSrc.pitch = minPitch;
                }
            }
            else
            {
                int randomIndex = Random.Range(0, dialogTypeSndClips.Length);
                soundClip = dialogTypeSndClips[randomIndex];
                audioSrc.pitch = Random.Range(minPitch, maxPitch);
            }
            audioSrc.PlayOneShot(soundClip);
        }
    }

    private void HideChoices()
    {
        foreach (GameObject choiceButton in choices)
        {
            choiceButton.SetActive(false);
        }
    }

    private void HandleTags(List<string> currentTags)
    {
        foreach (string tag in currentTags) {//loops and handles each tag
            string[] splitTag = tag.Split(":");//parsing tags
            if (splitTag.Length != 2)
            {
                Debug.LogError("Tag was not parsed: " + tag);
            }
            string tagKey = splitTag[0].Trim();
            string tagValue = splitTag[1].Trim();

            switch (tagKey)
            {
                case tagSpeaker:
                    //Debug.Log("speaker = " + tagValue);
                    displayName.text = tagValue;
                    break;
                case tagPortrait:
                    //Debug.Log("portrait = " + tagValue);
                    portraitAnimator.Play(tagValue);
                    break;
                case tagLayout:
                    Debug.Log("layout = " + tagValue);
                    break;
                case tagAudio:
                    setCurrentAudioInfo(tagValue);
                    break;
                default:
                    Debug.LogWarning("Tag came in but not currently handled: " + tag);
                    break;
            }
        }
    }

    private void DisplayChoices()
    {
        List<Choice> currentChoices = currentStory.currentChoices;
        if (currentChoices.Count > choices.Length)
        {//making sure the UI is able to suport the number of choices that are entering
            Debug.LogError("More choices were given to the UI is able to support. Num of choices given : " + currentChoices.Count);
        }
        int index = 0;

        foreach (Choice choice in currentChoices) { //enabling and initialising the choices for the choice amount in this line of dialogue
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }
        for (int i = index; i < choices.Length; i++) { //going through remaining UI supported choices and making them hidden
            choices[i].gameObject.SetActive(false);
        }
        StartCoroutine(SelectFirstChoice());
    }

    private IEnumerator SelectFirstChoice()
    {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
    }

    public void MakeChoice(int choiceIndex)
    {
        if (canContiToNextLine)
        {
            currentStory.ChooseChoiceIndex(choiceIndex);
            //ContinueStory();
        }
    }
}