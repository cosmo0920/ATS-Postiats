(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(*                              Hongwei Xi                             *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, Boston University
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
// Start Time: March, 2011
//
(* ****** ****** *)

%{#
#include "pats_lexbuf.cats"
%} // end of [%{#]

(* ****** ****** *)

staload LOC = "pats_location.sats"
typedef position = $LOC.position
typedef location = $LOC.location

(* ****** ****** *)

absviewt@ype
lexbuf = $extype "pats_lexbuf_struct"

(* ****** ****** *)

fun lexbuf_initialize_getchar (
  buf: &lexbuf? >> lexbuf, getchar: () -<cloref1> int
) : void // end of [lexbuf_initialize]

fun lexbuf_uninitialize (
  buf: &lexbuf >> lexbuf?
) : void // end of [lexbuf_uninitialize]

(* ****** ****** *)

fun lexbuf_get_base (buf: &lexbuf): lint

fun lexbuf_get_position
  (buf: &lexbuf, res: &position? >> position): void
// end of [lexbuf_get_position]

fun lexbuf_get_nspace (buf: &lexbuf): int
fun lexbuf_set_nspace (buf: &lexbuf, n: int): void

(* ****** ****** *)

fun lexbufpos_diff
  (buf: &lexbuf, pos: &position): uint
// end of [lexbufpos_diff]

fun lexbufpos_get_location
  (buf: &lexbuf, pos: &position): location
// end of [lexbufpos_get_location]

(* ****** ****** *)

fun lexbuf_get_char (buf: &lexbuf, nchr: uint): int
fun lexbufpos_get_char (buf: &lexbuf, position: &position): int

(* ****** ****** *)

fun lexbuf_incby_count (buf: &lexbuf, cnt: uint): void
fun lexbuf_reset_position (buf: &lexbuf, pos: &position): void

(* ****** ****** *)

fun lexbuf_get_strptr (buf: &lexbuf, ln: uint): strptr0
fun lexbufpos_get_strptr (buf: &lexbuf, pos: &position): strptr0

fun lexbuf_get_substrptr (buf: &lexbuf, st: uint, ln: uint): strptr0

(* ****** ****** *)

(* end of [pats_lexbuf.sats] *)
