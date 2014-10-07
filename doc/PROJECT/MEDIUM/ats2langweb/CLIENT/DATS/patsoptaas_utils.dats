(*
//
// Utilities
// for patsoptaas
//
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: September, 2014
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "Patsoptaas_"
#define
ATS_STATIC_PREFIX "Patsoptaas_"

(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload "./../SATS/atslangweb.sats"
//
(* ****** ****** *)
//
extern
fun
getWelcomeMessage
(
// argumentless
) : string = "mac#%"
//
%{^
//
function
Patsoptaas_getWelcomeMessage()
{
//
var
msg = "\
(*\n\
** Welcome to Patsopt-as-a-Service (PATSOPTAAS)\n\
*)\n\
" // end of [msg]
//
return msg;
} // end of [getWelcomeMessage]
//
%} // end of [%{^]
//
(* ****** ****** *)
//
staload _(*anon*) = "./patsopt_tcats.dats"
staload _(*anon*) = "./patsopt_ccats.dats"
staload _(*anon*) = "./patsopt_atscc2js.dats"
//
(* ****** ****** *)
//
extern
fun
thePatsopt_editor_get
  ((*void*)): string = "mac#%"
extern
fun
thePatsopt_editor_set
  (code: string): void= "mac#%"
//
%{^
//
function
Patsoptaas_thePatsopt_editor_get()
{
//
var
editor = ace.edit("thePage2RBody1");
//
return editor.getSession().getValue();
//
} // end of [Patsoptaas_thePatsopt_editor_get]
//
function
Patsoptaas_thePatsopt_editor_set(code)
{
//
var
editor = ace.edit("thePage2RBody1");
//
return editor.getSession().setValue(code);
//
} // end of [Patsoptaas_thePatsopt_editor_set]
//
%} // end o [%{^]
//
(* ****** ****** *)
//
extern
fun
thePatsopt_stderr_set
  (msg: string): void = "mac#%"
//
%{^
function
Patsoptaas_thePatsopt_stderr_set(msg)
{
//
document.getElementById("thePage2RBody2").value = msg;
//
} // end of [Patsoptaas_thePatsopt_stderr_set]
//
%} // end o [%{^]
//
(* ****** ****** *)
//
extern
fun
thePatsopt_source_get(): string = "mac#%"
extern
fun
thePatsopt_source_set(string): void= "mac#%"
//
%{^
//
var
Patsoptaas_thePatsopt_source = "";
//
function
Patsoptaas_thePatsopt_source_get()
{
  return Patsoptaas_thePatsopt_source;
} // end of [Patsoptaas_thePatsopt_source_get]
//
function
Patsoptaas_thePatsopt_source_set(str)
{
  Patsoptaas_thePatsopt_source = str; return;
} // end of [Patsoptaas_thePatsopt_source_set]
//
%} // end o [%{^]
//
(* ****** ****** *)
//
extern
fun
thePatsopt_output_get(): string = "mac#%"
extern
fun
thePatsopt_output_set(string): void= "mac#%"
//
%{^
//
var
Patsoptaas_thePatsopt_output = "";
//
function
Patsoptaas_thePatsopt_output_get()
{
//
return Patsoptaas_thePatsopt_output;
//
} // end of [Patsoptaas_thePatsopt_output_get]
//
function
Patsoptaas_thePatsopt_output_set(str)
{
/*
alert
(
  "Patsoptaas_thePatsopt_output_set:\n" + str
); // end of [alert]
*/
Patsoptaas_thePatsopt_output = str; return;
//
} // end of [Patsoptaas_thePatsopt_output_set]
//
%} // end o [%{^]
//
(* ****** ****** *)
//
extern
fun
thePatsopt2js_output_get(): string = "mac#%"
extern
fun
thePatsopt2js_output_set(string): void= "mac#%"
//
%{^
//
var
Patsoptaas_thePatsopt2js_output = "";
//
function
Patsoptaas_thePatsopt2js_output_get()
{
//
return Patsoptaas_thePatsopt2js_output;
//
} // end of [Patsoptaas_thePatsopt2js_output_get]
//
function
Patsoptaas_thePatsopt2js_output_set(str)
{
/*
alert
(
  "Patsoptaas_thePatsopt2js_output_set:\n" + str
); // end of [alert]
*/
Patsoptaas_thePatsopt2js_output = str; return;
//
} // end of [Patsoptaas_thePatsopt2js_output_set]
//
%} // end o [%{^]
//
(* ****** ****** *)
//
extern
fun
Compile_patsopttc_reply
  (reply: string): void = "mac#%"
extern
fun Compile_patsopttc_onclick(): void = "mac#%"
//
(* ****** ****** *)
//
%{^
//
function
Patsoptaas_Compile_patsopttc_reply
  (reply)
{
  var comparr =
    JSON.parse(decodeURIComponent(reply));
  // end of [var]
  var msg0 = "Patsoptaas: [patsopt-tcats] passed!"
  var msg1 = "Patsoptaas: [patsopt-tcats] failed!"
  if(comparr[0]===0)
  {
    Patsoptaas_thePatsopt_stderr_set(msg0);
    if(!Patsoptaas_Compile_stderr_flag()) alert(msg0);
  }
  if(comparr[0] > 0)
  {
    Patsoptaas_thePatsopt_stderr_set(comparr[1]);
    if(!Patsoptaas_Compile_stderr_flag()) alert(msg1);
  }
  return;
}
//
%} // end of [%{^]
//
implement
Compile_patsopttc_onclick() = let
//
implement
patsopt_tcats_rpc$cname<> () =
  "SERVER/mycode/atslangweb_patsopt_tcats_0_.php"
//
implement
patsopt_tcats_rpc$reply<> (reply) = Compile_patsopttc_reply (reply)
//
val mycode = thePatsopt_editor_get ()
val ((*void*)) = patsopt_tcats_rpc (mycode)
//
in
  // nothing
end (* end of [Compile_patsopttc_onclick] *)
//
(* ****** ****** *)
//
extern
fun
Compile_patsoptcc_reply
  (reply: string): void = "mac#%"
extern
fun Compile_patsoptcc_onclick(): void = "mac#%"
//
(* ****** ****** *)
//
%{^
//
function
Patsoptaas_Compile_patsoptcc_reply
  (reply)
{
  var comparr =
    JSON.parse(decodeURIComponent(reply));
  // end of [var]
  var msg0 = "Patsoptaas: [patsopt-ccats] passed!"
  var msg1 = "Patsoptaas: [patsopt-ccats] failed!"
  if(comparr[0]===0)
  {
    Patsoptaas_thePatsopt_stderr_set(msg0);
    Patsoptaas_thePatsopt_output_set(comparr[1]);
    if(!Patsoptaas_Compile_stderr_flag()) alert(msg0);
  }
  if(comparr[0] > 0)
  {
    Patsoptaas_thePatsopt_stderr_set(comparr[1]);
    if(!Patsoptaas_Compile_stderr_flag()) alert(msg1);
  }
  return;
}
//
%} // end of [%{^]
//
implement
Compile_patsoptcc_onclick() = let
//
implement
patsopt_ccats_rpc$cname<> () =
  "SERVER/mycode/atslangweb_patsopt_ccats_0_.php"
//
implement
patsopt_ccats_rpc$reply<> (reply) = Compile_patsoptcc_reply (reply)
//
val mycode = thePatsopt_editor_get ()
val ((*void*)) = patsopt_ccats_rpc (mycode)
//
in
  // nothing
end (* end of [Compile_patsoptcc_onclick] *)
//
(* ****** ****** *)
//
extern
fun
Compile_patsopt2js_reply
  (reply: string): void = "mac#%"
//
extern
fun Compile_patsopt2js_onclick(): void = "mac#%"
//
(* ****** ****** *)
//
%{^
//
function
Patsoptaas_Compile_patsopt2js_reply
  (reply)
{
  var comparr =
    JSON.parse(decodeURIComponent(reply));
  // end of [var]
  var msg0 = "Patsoptaas: [patsopt-atscc2js] passed!"
  var msg1 = "Patsoptaas: [patsopt-atscc2js] failed!"
  if(comparr[0]===0)
  {
    Patsoptaas_thePatsopt_stderr_set(msg0);
    Patsoptaas_thePatsopt2js_output_set(comparr[1]);
    if(!Patsoptaas_Compile_stderr_flag()) alert(msg0);
    if(Patsoptaas_Patsopt2js_eval_flag()) eval(comparr[1]);
  }
  if(comparr[0] > 0)
  {
    Patsoptaas_thePatsopt_stderr_set(comparr[1]);
    if(!Patsoptaas_Compile_stderr_flag()) alert(msg1);
  }
  return;
}
//
%} // end of [%{^]
//
implement
Compile_patsopt2js_onclick() = let
//
implement
patsopt_atscc2js_rpc$cname<> () =
  "SERVER/mycode/atslangweb_patsopt_atscc2js_0_.php"
//
implement
patsopt_atscc2js_rpc$reply<> (reply) = Compile_patsopt2js_reply (reply)
//
val mycode = thePatsopt_editor_get ()
val ((*void*)) = patsopt_atscc2js_rpc (mycode)
//
in
  // nothing
end (* end of [Compile_patsopt2js_onclick] *)
//
(* ****** ****** *)
//
extern
fun
Evaluate_JS_onclick(): void = "mac#%"
//
%{^
//
function
Patsoptaas_Evaluate_JS_onclick()
{
//
  var
  mycode =
  Patsoptaas_thePatsopt2js_output_get();
//
  if(mycode)
  {
    eval(mycode);
  } else {
    alert("There is no generated JS code yet!");
  } // end of [if]
//
} // end of [Patsoptaas_Evaluate_JS_onclick]
//
%} // end of [%{^]
//
(* ****** ****** *)

(* end of [patsoptaas_utils.dats] *)