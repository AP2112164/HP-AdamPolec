using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class displayHelp : MonoBehaviour
{
    [SerializeField] private GameObject helpPanel;
    // Start is called before the first frame update
    void Start()
    {
        helpPanel.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.H))
        {
            helpPanel.SetActive(!helpPanel.activeSelf);
        }
    }
}
