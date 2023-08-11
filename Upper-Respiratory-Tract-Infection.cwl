cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  upper-respiratory-tract-infection-influenza---primary:
    run: upper-respiratory-tract-infection-influenza---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  upper-respiratory-tract-infection-swine---primary:
    run: upper-respiratory-tract-infection-swine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-influenza---primary/output
  acute-upper-respiratory-tract-infection---primary:
    run: acute-upper-respiratory-tract-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-swine---primary/output
  upper-respiratory-tract-infection-pharyngitis---primary:
    run: upper-respiratory-tract-infection-pharyngitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: acute-upper-respiratory-tract-infection---primary/output
  upper-respiratory-tract-infection---primary:
    run: upper-respiratory-tract-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-pharyngitis---primary/output
  viral-upper-respiratory-tract-infection---primary:
    run: viral-upper-respiratory-tract-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection---primary/output
  upper-respiratory-tract-infection-tonsillitis---primary:
    run: upper-respiratory-tract-infection-tonsillitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: viral-upper-respiratory-tract-infection---primary/output
  upper-respiratory-tract-infection-laryngotracheitis---primary:
    run: upper-respiratory-tract-infection-laryngotracheitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-tonsillitis---primary/output
  upper-respiratory-tract-infection-obstruction---primary:
    run: upper-respiratory-tract-infection-obstruction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-laryngotracheitis---primary/output
  other-upper-respiratory-tract-infection---primary:
    run: other-upper-respiratory-tract-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-obstruction---primary/output
  upper-respiratory-tract-infection-laryngitis---primary:
    run: upper-respiratory-tract-infection-laryngitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: other-upper-respiratory-tract-infection---primary/output
  multiple-upper-respiratory-tract-infection---primary:
    run: multiple-upper-respiratory-tract-infection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-laryngitis---primary/output
  respiratory---primary:
    run: respiratory---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: multiple-upper-respiratory-tract-infection---primary/output
  upper-respiratory-tract-infection-manifestation---primary:
    run: upper-respiratory-tract-infection-manifestation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: respiratory---primary/output
  upper-respiratory-tract-infection-illness---primary:
    run: upper-respiratory-tract-infection-illness---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-manifestation---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-illness---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
