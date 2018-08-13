%%%-------------------------------------------------------------------
%%% @author alex_shavelev
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Авг. 2018 10:25
%%%-------------------------------------------------------------------
-module(ofp_v6).
-author("alex_shavelev").

%% API
-export([]).

%%------------------------------------------------------------------------------
%% Copyright 2012 FlowForwarding.org
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%-----------------------------------------------------------------------------

%% @author Erlang Solutions Ltd. <openflow@erlang-solutions.com>
%% @author Konrad Kaplita <konrad.kaplita@erlang-solutions.com>
%% @author Krzysztof Rutka <krzysztof.rutka@erlang-solutions.com>
%% @copyright 2012 FlowForwarding.org
%% @doc OpenFlow Protocol 1.4 (5) implementation.
%% @private

-behaviour(gen_protocol).

%% gen_protocol callbacks
-export([encode/1, decode/1]).

-include("of_protocol.hrl").
-include("ofp_v6.hrl").

%%------------------------------------------------------------------------------
%% gen_protocol callbacks
%%------------------------------------------------------------------------------

%% @doc Encode erlang representation to binary.
-spec encode(Message :: ofp_message()) -> {ok, binary()} |
{error, any()}.
encode(Message) ->
  try
    {ok, ofp_v6_encode:do(Message)}
  catch
    _:Exception ->
      {error, Exception}
  end.

%% @doc Decode binary to erlang representation.
-spec decode(Binary :: binary()) -> {ok, ofp_message(), binary()} |
{error, any()}.
decode(Binary) ->
  try
    ofp_v6_decode:do(Binary)
  catch
    _:Exception ->
      {error, Exception}
  end.

