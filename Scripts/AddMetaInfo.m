(* ::Package:: *)

notes = File /@ FileNames["*.note", ParentDirectory@NotebookDirectory[], Infinity];
Echo[Length@notes, "Notes: "];


AddMetaInfo[note_File] := Block[
	{txt = Import[note, "Text"], time = "", name = ""},
	If[
		!StringContainsQ[txt, "\\title"],
		name = StringJoin["\\title: ", FileBaseName[note], "\n"]
	];
	If[
		!StringContainsQ[txt, "\\date"],
		time = StringJoin[
			"\\date: ",
			StringReplace[DateString[Information[note, "CreationDate"], "ISODateTime"], "T" -> " "],
			"\n"
		]
	];
	Export[note, StringJoin[name, time, txt], "Text"]
];


AddMetaInfo /@ notes
