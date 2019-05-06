#!/usr/bin/env cwl-runner

class: CommandLineTool
id: "scvis-tool"
label: "scvis-tool"

doc: |
    ![build_status](https://quay.io/repository/nceglia/scvis-tool/status)
    A Docker container for the scvis. See the [scvis](https://github.com/shahcompbio/scvis) website for more information.

dct:creator:
  "@id": "https://orcid.org/0000-0001-9387-103X"
  foaf:name: Nicholas Ceglia
  foaf:mbox: "mailto:nickceglia@gmail.com"
requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/nceglia/scvis-tool:latest"


cwlVersion: v1.0

inputs:
  data_matrix_file:
    type: File
    doc: "Gene by Cell counts matrix."
    inputBinding:
      position: 1
outputs:
  embedding:
    type: File
    outputBinding:
      glob: "scvis-results.tar.gz"
    doc: "scvis results tarballed."

baseCommand: ["python", "/codebase/run_scvis.py"]

$namespaces:
  dct: http://purl.org/dc/terms/
  foaf: http://xmlns.com/foaf/0.1/
