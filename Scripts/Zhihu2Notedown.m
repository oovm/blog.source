(* ::Package:: *)

Zhihu2Notedown[url_String] := Block[
	{q, a, request, article, xml, notes, out},
	{q, a} = StringCases[url, {"question/" ~~ d : DigitCharacter.. :> d, "answer/" ~~ d : DigitCharacter.. :> ToExpression@d}];
	request = Import["https://www.zhihu.com/api/v4/questions/" <> q <> "/answers?include=data%5B*%5Dcontent&offset=&limit=10", "RawJSON"];
	article = Select[request["data"], #id == a&];
	xml = ImportString[article[[1, "content"]], {"HTML", "XMLObject"}];
	notes = xml[[2, -1, -1, -1]] /. XMLElement -> AnswerHandler;
	out = StringRiffle[Flatten@notes, "\n\n"];
	CopyToClipboard@out;
	Return@out
];


AnswerHandler["figure", __] := Nothing;
AnswerHandler["hr", __] := "---";
AnswerHandler["noscript", {}, p_] := p;
AnswerHandler["p", {}, p_List] := StringJoin@p;
AnswerHandler["a", attr_List, body_List] := Block[
	{dict = Association@attr},
	TemplateApply["\\link[`1`][`2`]", {StringJoin[body], dict["href"]}]
];
AnswerHandler["sup", attr_List, body_List] := Block[
	{dict = Association@attr},
	TemplateApply["\\link[`1`][`2`]", {dict["data-numero"], dict["data-url"]}]
];
AnswerHandler["img", attr_List, _] := Block[
	{dict = Association@attr},
	If[!MissingQ@dict["alt"],
		Return@TemplateApply["$`1`$", {dict["alt"]}]
	];
	If[!MissingQ@dict["data-actualsrc"],
		Return@TemplateApply["\\img[`1`]", {dict["data-actualsrc"]}]
	];
	Return@Nothing
];
