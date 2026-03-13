(* :Title: 	NCOptions *)

(* :Author: 	mauricio *)

(* :Context: 	NCOptions` *)

(* :Summary:
*)

(* :Alias:
*)

(* :Warnings: 
*)

(* :History: 
*)

BeginPackage[ "NCOptions`" ];

Clear[SelfAdjointVariables, 
      SymmetricVariables, 
      ExcludeVariables,
      SmallCapSymbolsNonCommutative,
      ShowBanner];
 
Options[NCOptions] = {
  SmallCapSymbolsNonCommutative -> False,
  ShowBanner ->	False,
  UseNotation -> False
};

EndPackage[ ];
