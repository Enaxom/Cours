
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | XXXX
    | NAME of (
# 2 "parser.mly"
       (string)
# 12 "parser.ml"
  )
    | INT of (
# 1 "parser.mly"
       (int)
# 17 "parser.ml"
  )
    | EOF
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState8
  | MenhirState0

let rec _menhir_goto_main : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "parser.mly"
       ((int*string*int*int) list)
# 42 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_1 : (
# 10 "parser.mly"
       ((int*string*int*int) list)
# 52 "parser.ml"
        )) = _v in
        Obj.magic _1
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (m : (
# 10 "parser.mly"
       ((int*string*int*int) list)
# 61 "parser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s, (stat : (
# 7 "parser.mly"
      ((int*string*int*int))
# 66 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 10 "parser.mly"
       ((int*string*int*int) list)
# 71 "parser.ml"
        ) = 
# 16 "parser.mly"
                        ( stat :: m)
# 75 "parser.ml"
         in
        _menhir_goto_main _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_ligne : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "parser.mly"
      ((int*string*int*int))
# 82 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState8 in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (stat : (
# 7 "parser.mly"
      ((int*string*int*int))
# 97 "parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 10 "parser.mly"
       ((int*string*int*int) list)
# 103 "parser.ml"
        ) = 
# 15 "parser.mly"
                   ( [stat] )
# 107 "parser.ml"
         in
        _menhir_goto_main _menhir_env _menhir_stack _menhir_s _v
    | INT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 1 "parser.mly"
       (int)
# 131 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAME _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | INT _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (nb : (
# 1 "parser.mly"
       (int)
# 157 "parser.ml"
                )) = _v in
                let (((_menhir_stack, _menhir_s, (sexe : (
# 1 "parser.mly"
       (int)
# 162 "parser.ml"
                ))), (prenom : (
# 2 "parser.mly"
       (string)
# 166 "parser.ml"
                ))), (annee : (
# 1 "parser.mly"
       (int)
# 170 "parser.ml"
                ))) = _menhir_stack in
                let _v : (
# 7 "parser.mly"
      ((int*string*int*int))
# 175 "parser.ml"
                ) = 
# 19 "parser.mly"
                                                ((sexe,prenom,annee,nb))
# 179 "parser.ml"
                 in
                _menhir_goto_ligne _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | XXXX ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | INT _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (nb : (
# 1 "parser.mly"
       (int)
# 200 "parser.ml"
                )) = _v in
                let ((_menhir_stack, _menhir_s, (sexe : (
# 1 "parser.mly"
       (int)
# 205 "parser.ml"
                ))), (prenom : (
# 2 "parser.mly"
       (string)
# 209 "parser.ml"
                ))) = _menhir_stack in
                let _3 = () in
                let _v : (
# 7 "parser.mly"
      ((int*string*int*int))
# 215 "parser.ml"
                ) = 
# 20 "parser.mly"
                                         ((sexe,prenom,-1,nb))
# 219 "parser.ml"
                 in
                _menhir_goto_ligne _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 10 "parser.mly"
       ((int*string*int*int) list)
# 256 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 280 "parser.ml"
