º
UC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\Services\ProfileService.cs
	namespace 	
EdoAuthServer
 
. 
Services  
{ 
public		 

class		 
ProfileService		 
:		  !
IProfileService		" 1
{

 
private 
readonly 
UserManager $
<$ %
ApplicationUser% 4
>4 5
_userManager6 B
;B C
public 
ProfileService 
( 
UserManager )
<) *
ApplicationUser* 9
>9 :
userManager; F
)F G
{ 	
_userManager 
= 
userManager &
;& '
} 	
public 
async 
Task 
GetProfileDataAsync -
(- .%
ProfileDataRequestContext. G
contextH O
)O P
{ 	
var 
user 
= 
await 
_userManager )
.) *
GetUserAsync* 6
(6 7
context7 >
.> ?
Subject? F
)F G
;G H
if 
( 
user 
== 
null 
) 
return $
;$ %
var 
claims 
= 
new 
List !
<! "
Claim" '
>' (
{ 
new 
Claim 
( 
$str 
,  
user! %
.% &
Id& (
)( )
,) *
new 
Claim 
( 
$str  
,  !
user" &
.& '
UserName' /
??0 2
$str3 5
)5 6
,6 7
new 
Claim 
( 
$str .
,. /
user0 4
.4 5
UserName5 =
??> @
$strA C
)C D
,D E
new 
Claim 
( 
$str !
,! "
user# '
.' (
Email( -
??. 0
$str1 3
)3 4
,4 5
new 
Claim 
( 
$str $
,$ %
user& *
.* +
FullName+ 3
??4 6
$str7 9
)9 :
} 
; 
context!! 
.!! 
IssuedClaims!!  
.!!  !
AddRange!!! )
(!!) *
claims!!* 0
)!!0 1
;!!1 2
}"" 	
public$$ 
async$$ 
Task$$ 
IsActiveAsync$$ '
($$' (
IsActiveContext$$( 7
context$$8 ?
)$$? @
{%% 	
var&& 
user&& 
=&& 
await&& 
_userManager&& )
.&&) *
GetUserAsync&&* 6
(&&6 7
context&&7 >
.&&> ?
Subject&&? F
)&&F G
;&&G H
context'' 
.'' 
IsActive'' 
='' 
user'' #
!=''$ &
null''' +
;''+ ,
}(( 	
})) 
}** ˝+
EC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\Program.cs
var		 
builder		 
=		 
WebApplication		 
.		 
CreateBuilder		 *
(		* +
args		+ /
)		/ 0
;		0 1
builder 
. 
Services 
. 
AddDbContext 
<  
ApplicationDbContext 2
>2 3
(3 4
options4 ;
=>< >
{ 
options 
. 
	UseSqlite 
( 
builder 
. 
Configuration +
.+ ,
GetConnectionString, ?
(? @
$str@ S
)S T
)T U
;U V
} 
) 
; 
builder 
. 
Services 
. 
AddIdentity 
< 
ApplicationUser ,
,, -
IdentityRole. :
>: ;
(; <
options< C
=>D F
{ 
options 
. 
Password 
. 
RequiredLength #
=$ %
$num& '
;' (
options 
. 
Password 
. 
RequireDigit !
=" #
true$ (
;( )
options 
. 
Password 
. "
RequireNonAlphanumeric +
=, -
true. 2
;2 3
options 
. 
Password 
. 
RequireUppercase %
=& '
true( ,
;, -
options 
. 
Password 
. 
RequireLowercase %
=& '
false( -
;- .
options 
. 
Password 
. 
RequiredUniqueChars (
=) *
$num+ ,
;, -
options   
.   
User   
.   
RequireUniqueEmail   #
=  $ %
true  & *
;  * +
}!! 
)!! 
."" $
AddEntityFrameworkStores"" 
<""  
ApplicationDbContext"" .
>"". /
(""/ 0
)""0 1
.## $
AddDefaultTokenProviders## 
(## 
)## 
;## 
builder(( 
.(( 
Services(( 
.)) 
AddIdentityServer)) 
()) 
options)) 
=>)) !
{** 
options++ 
.++ 
Events++ 
.++ 
RaiseErrorEvents++ '
=++( )
true++* .
;++. /
options,, 
.,, 
Events,, 
.,, "
RaiseInformationEvents,, -
=,,. /
true,,0 4
;,,4 5
options-- 
.-- 
Events-- 
.-- 
RaiseFailureEvents-- )
=--* +
true--, 0
;--0 1
options.. 
... 
Events.. 
... 
RaiseSuccessEvents.. )
=..* +
true.., 0
;..0 1
}// 
)// 
.00 
AddAspNetIdentity00 
<00 
ApplicationUser00 &
>00& '
(00' (
)00( )
.11 
AddProfileService11 
<11 
EdoAuthServer11 $
.11$ %
Services11% -
.11- .
ProfileService11. <
>11< =
(11= >
)11> ?
.22 (
AddInMemoryIdentityResources22 !
(22! "
Config22" (
.22( )
IdentityResources22) :
)22: ;
.33  
AddInMemoryApiScopes33 
(33 
Config33  
.33  !
	ApiScopes33! *
)33* +
.44 
AddInMemoryClients44 
(44 
Config44 
.44 
Clients44 &
)44& '
.55 )
AddDeveloperSigningCredential55 "
(55" #
)55# $
;55$ %
builder:: 
.:: 
Services:: 
.:: #
AddControllersWithViews:: (
(::( )
)::) *
;::* +
builder;; 
.;; 
Services;; 
.;; 
AddRazorPages;; 
(;; 
);;  
.<< 
WithRazorPagesRoot<< 
(<< 
$str<< 1
)<<1 2
;<<2 3
varAA 
appAA 
=AA 	
builderAA
 
.AA 
BuildAA 
(AA 
)AA 
;AA 
ifFF 
(FF 
appFF 
.FF 
EnvironmentFF 
.FF 
IsDevelopmentFF !
(FF! "
)FF" #
)FF# $
{GG 
appHH 
.HH %
UseDeveloperExceptionPageHH !
(HH! "
)HH" #
;HH# $
}II 
appKK 
.KK 
UseStaticFilesKK 
(KK 
)KK 
;KK 
appLL 
.LL 

UseRoutingLL 
(LL 
)LL 
;LL 
appNN 
.NN 
UseIdentityServerNN 
(NN 
)NN 
;NN 
appOO 
.OO 
UseAuthorizationOO 
(OO 
)OO 
;OO 
appQQ 
.QQ 
MapRazorPagesQQ 
(QQ 
)QQ 
;QQ 
appRR 
.RR %
MapDefaultControllerRouteRR 
(RR 
)RR 
;RR  
appTT 
.TT 
RunTT 
(TT 
)TT 	
;TT	 
˘
TC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\Models\ApplicationUser.cs
	namespace 	
EdoAuthServer
 
. 
Models 
{ 
public 

class 
ApplicationUser  
:! "
IdentityUser# /
{ 
public 
string 
? 
FullName 
{  !
get" %
;% &
set' *
;* +
}, -
} 
}		 Â%
^C:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\TestUsers.cs
	namespace

 	
EdoAuthServer


 
.

 
UI

 
;

 
public 
static 
class 
	TestUsers 
{ 
public 

static 
List 
< 
TestUser 
>  
Users! &
{ 
get 
{ 	
var 
address 
= 
new 
{ 
street_address 
=  
$str! 1
,1 2
locality 
= 
$str '
,' (
postal_code 
= 
$str %
,% &
country 
= 
$str #
} 
; 
return 
new 
List 
< 
TestUser $
>$ %
{ 
new 
TestUser 
{ 
	SubjectId 
= 
$str  #
,# $
Username 
= 
$str &
,& '
Password   
=   
$str   &
,  & '
Claims!! 
=!! 
{"" 
new## 
Claim## !
(##! "
JwtClaimTypes##" /
.##/ 0
Name##0 4
,##4 5
$str##6 C
)##C D
,##D E
new$$ 
Claim$$ !
($$! "
JwtClaimTypes$$" /
.$$/ 0
	GivenName$$0 9
,$$9 :
$str$$; B
)$$B C
,$$C D
new%% 
Claim%% !
(%%! "
JwtClaimTypes%%" /
.%%/ 0

FamilyName%%0 :
,%%: ;
$str%%< C
)%%C D
,%%D E
new&& 
Claim&& !
(&&! "
JwtClaimTypes&&" /
.&&/ 0
Email&&0 5
,&&5 6
$str&&7 M
)&&M N
,&&N O
new'' 
Claim'' !
(''! "
JwtClaimTypes''" /
.''/ 0
EmailVerified''0 =
,''= >
$str''? E
,''E F
ClaimValueTypes''G V
.''V W
Boolean''W ^
)''^ _
,''_ `
new(( 
Claim(( !
(((! "
JwtClaimTypes((" /
.((/ 0
WebSite((0 7
,((7 8
$str((9 K
)((K L
,((L M
new)) 
Claim)) !
())! "
JwtClaimTypes))" /
.))/ 0
Address))0 7
,))7 8
JsonSerializer))9 G
.))G H
	Serialize))H Q
())Q R
address))R Y
)))Y Z
,))Z [#
IdentityServerConstants))\ s
.))s t
ClaimValueTypes	))t É
.
))É Ñ
Json
))Ñ à
)
))à â
}** 
}++ 
,++ 
new,, 
TestUser,, 
{-- 
	SubjectId.. 
=.. 
$str..  #
,..# $
Username// 
=// 
$str// $
,//$ %
Password00 
=00 
$str00 $
,00$ %
Claims11 
=11 
{22 
new33 
Claim33 !
(33! "
JwtClaimTypes33" /
.33/ 0
Name330 4
,334 5
$str336 A
)33A B
,33B C
new44 
Claim44 !
(44! "
JwtClaimTypes44" /
.44/ 0
	GivenName440 9
,449 :
$str44; @
)44@ A
,44A B
new55 
Claim55 !
(55! "
JwtClaimTypes55" /
.55/ 0

FamilyName550 :
,55: ;
$str55< C
)55C D
,55D E
new66 
Claim66 !
(66! "
JwtClaimTypes66" /
.66/ 0
Email660 5
,665 6
$str667 K
)66K L
,66L M
new77 
Claim77 !
(77! "
JwtClaimTypes77" /
.77/ 0
EmailVerified770 =
,77= >
$str77? E
,77E F
ClaimValueTypes77G V
.77V W
Boolean77W ^
)77^ _
,77_ `
new88 
Claim88 !
(88! "
JwtClaimTypes88" /
.88/ 0
WebSite880 7
,887 8
$str889 I
)88I J
,88J K
new99 
Claim99 !
(99! "
JwtClaimTypes99" /
.99/ 0
Address990 7
,997 8
JsonSerializer999 G
.99G H
	Serialize99H Q
(99Q R
address99R Y
)99Y Z
,99Z [#
IdentityServerConstants99\ s
.99s t
ClaimValueTypes	99t É
.
99É Ñ
Json
99Ñ à
)
99à â
}:: 
};; 
}<< 
;<< 
}== 	
}>> 
}?? ºO
^C:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Telemetry.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
;  !
public 
static 
class 
	Telemetry 
{ 
private 
static 
readonly 
string "
ServiceVersion# 1
=2 3
typeof4 :
(: ;
	Telemetry; D
)D E
.E F
AssemblyF N
.N O
GetNameO V
(V W
)W X
.X Y
VersionY `
!` a
.a b
ToStringb j
(j k
)k l
;l m
public 

static 
readonly 
string !
ServiceName" -
=. /
typeof0 6
(6 7
	Telemetry7 @
)@ A
.A B
AssemblyB J
.J K
GetNameK R
(R S
)S T
.T U
NameU Y
!Y Z
;Z [
public 

static 
class 
Metrics 
{ 
public!! 
static!! 
class!! 
Counters!! $
{"" 	
public## 
const## 
string## 
Consent##  '
=##( )
$str##* @
;##@ A
public$$ 
const$$ 
string$$ 
GrantsRevoked$$  -
=$$. /
$str$$0 M
;$$M N
public%% 
const%% 
string%% 
	UserLogin%%  )
=%%* +
$str%%, E
;%%E F
public&& 
const&& 
string&& 

UserLogout&&  *
=&&+ ,
$str&&- G
;&&G H
}'' 	
public,, 
static,, 
class,, 
Tags,,  
{-- 	
public.. 
const.. 
string.. 
Client..  &
=..' (
$str..) 1
;..1 2
public// 
const// 
string// 
Error//  %
=//& '
$str//( /
;/// 0
public00 
const00 
string00 
Idp00  #
=00$ %
$str00& +
;00+ ,
public11 
const11 
string11 
Remember11  (
=11) *
$str11+ 5
;115 6
public22 
const22 
string22 
Scope22  %
=22& '
$str22( /
;22/ 0
public33 
const33 
string33 
Consent33  '
=33( )
$str33* 3
;333 4
}44 	
public99 
static99 
class99 
	TagValues99 %
{:: 	
public;; 
const;; 
string;; 
Granted;;  '
=;;( )
$str;;* 3
;;;3 4
public<< 
const<< 
string<< 
Denied<<  &
=<<' (
$str<<) 1
;<<1 2
}== 	
privateDD 
staticDD 
readonlyDD 
MeterDD  %
MeterDD& +
=DD, -
newDD. 1
MeterDD2 7
(DD7 8
ServiceNameDD8 C
,DDC D
ServiceVersionDDE S
)DDS T
;DDT U
privateFF 
staticFF 
CounterFF 
<FF 
longFF #
>FF# $
ConsentCounterFF% 3
=FF4 5
MeterFF6 ;
.FF; <
CreateCounterFF< I
<FFI J
longFFJ N
>FFN O
(FFO P
CountersFFP X
.FFX Y
ConsentFFY `
)FF` a
;FFa b
publicNN 
staticNN 
voidNN 
ConsentGrantedNN )
(NN) *
stringNN* 0
clientIdNN1 9
,NN9 :
IEnumerableNN; F
<NNF G
stringNNG M
>NNM N
scopesNNO U
,NNU V
boolNNW [
rememberNN\ d
)NNd e
{OO 	!
ArgumentNullExceptionPP !
.PP! "
ThrowIfNullPP" -
(PP- .
scopesPP. 4
)PP4 5
;PP5 6
foreachRR 
(RR 
varRR 
scopeRR 
inRR !
scopesRR" (
)RR( )
{SS 
ConsentCounterTT 
.TT 
AddTT "
(TT" #
$numTT# $
,TT$ %
newUU 
(UU 
TagsUU 
.UU 
ClientUU #
,UU# $
clientIdUU% -
)UU- .
,UU. /
newVV 
(VV 
TagsVV 
.VV 
ScopeVV "
,VV" #
scopeVV$ )
)VV) *
,VV* +
newWW 
(WW 
TagsWW 
.WW 
RememberWW %
,WW% &
rememberWW' /
)WW/ 0
,WW0 1
newXX 
(XX 
TagsXX 
.XX 
ConsentXX $
,XX$ %
	TagValuesXX& /
.XX/ 0
GrantedXX0 7
)XX7 8
)XX8 9
;XX9 :
}YY 
}ZZ 	
publicbb 
staticbb 
voidbb 
ConsentDeniedbb (
(bb( )
stringbb) /
clientIdbb0 8
,bb8 9
IEnumerablebb: E
<bbE F
stringbbF L
>bbL M
scopesbbN T
)bbT U
{cc 	!
ArgumentNullExceptiondd !
.dd! "
ThrowIfNulldd" -
(dd- .
scopesdd. 4
)dd4 5
;dd5 6
foreachee 
(ee 
varee 
scopeee 
inee !
scopesee" (
)ee( )
{ff 
ConsentCountergg 
.gg 
Addgg "
(gg" #
$numgg# $
,gg$ %
newgg& )
(gg) *
Tagsgg* .
.gg. /
Clientgg/ 5
,gg5 6
clientIdgg7 ?
)gg? @
,gg@ A
newggB E
(ggE F
TagsggF J
.ggJ K
ScopeggK P
,ggP Q
scopeggR W
)ggW X
,ggX Y
newggZ ]
(gg] ^
Tagsgg^ b
.ggb c
Consentggc j
,ggj k
	TagValuesggl u
.ggu v
Deniedggv |
)gg| }
)gg} ~
;gg~ 
}hh 
}ii 	
privatekk 
statickk 
Counterkk 
<kk 
longkk #
>kk# $ 
GrantsRevokedCounterkk% 9
=kk: ;
Meterkk< A
.kkA B
CreateCounterkkB O
<kkO P
longkkP T
>kkT U
(kkU V
CounterskkV ^
.kk^ _
GrantsRevokedkk_ l
)kkl m
;kkm n
publicqq 
staticqq 
voidqq 
GrantsRevokedqq (
(qq( )
stringqq) /
?qq/ 0
clientIdqq1 9
)qq9 :
=>rr  
GrantsRevokedCounterrr #
.rr# $
Addrr$ '
(rr' (
$numrr( )
,rr) *
tagrr+ .
:rr. /
newrr0 3
(rr3 4
Tagsrr4 8
.rr8 9
Clientrr9 ?
,rr? @
clientIdrrA I
)rrI J
)rrJ K
;rrK L
privatett 
statictt 
Countertt 
<tt 
longtt #
>tt# $
UserLoginCountertt% 5
=tt6 7
Metertt8 =
.tt= >
CreateCountertt> K
<ttK L
longttL P
>ttP Q
(ttQ R
CountersttR Z
.ttZ [
	UserLogintt[ d
)ttd e
;tte f
publiczz 
staticzz 
voidzz 
	UserLoginzz $
(zz$ %
stringzz% +
?zz+ ,
clientIdzz- 5
,zz5 6
stringzz7 =
idpzz> A
)zzA B
=>{{ 
UserLoginCounter{{ 
.{{  
Add{{  #
({{# $
$num{{$ %
,{{% &
new{{' *
({{* +
Tags{{+ /
.{{/ 0
Client{{0 6
,{{6 7
clientId{{8 @
){{@ A
,{{A B
new{{C F
({{F G
Tags{{G K
.{{K L
Idp{{L O
,{{O P
idp{{Q T
){{T U
){{U V
;{{V W
public
ÇÇ 
static
ÇÇ 
void
ÇÇ 
UserLoginFailure
ÇÇ +
(
ÇÇ+ ,
string
ÇÇ, 2
?
ÇÇ2 3
clientId
ÇÇ4 <
,
ÇÇ< =
string
ÇÇ> D
idp
ÇÇE H
,
ÇÇH I
string
ÇÇJ P
error
ÇÇQ V
)
ÇÇV W
=>
ÉÉ 
UserLoginCounter
ÉÉ 
.
ÉÉ  
Add
ÉÉ  #
(
ÉÉ# $
$num
ÉÉ$ %
,
ÉÉ% &
new
ÉÉ' *
(
ÉÉ* +
Tags
ÉÉ+ /
.
ÉÉ/ 0
Client
ÉÉ0 6
,
ÉÉ6 7
clientId
ÉÉ8 @
)
ÉÉ@ A
,
ÉÉA B
new
ÉÉC F
(
ÉÉF G
Tags
ÉÉG K
.
ÉÉK L
Idp
ÉÉL O
,
ÉÉO P
idp
ÉÉQ T
)
ÉÉT U
,
ÉÉU V
new
ÉÉW Z
(
ÉÉZ [
Tags
ÉÉ[ _
.
ÉÉ_ `
Error
ÉÉ` e
,
ÉÉe f
error
ÉÉg l
)
ÉÉl m
)
ÉÉm n
;
ÉÉn o
private
ÖÖ 
static
ÖÖ 
Counter
ÖÖ 
<
ÖÖ 
long
ÖÖ #
>
ÖÖ# $
UserLogoutCounter
ÖÖ% 6
=
ÖÖ7 8
Meter
ÖÖ9 >
.
ÖÖ> ?
CreateCounter
ÖÖ? L
<
ÖÖL M
long
ÖÖM Q
>
ÖÖQ R
(
ÖÖR S
Counters
ÖÖS [
.
ÖÖ[ \

UserLogout
ÖÖ\ f
)
ÖÖf g
;
ÖÖg h
public
ãã 
static
ãã 
void
ãã 

UserLogout
ãã %
(
ãã% &
string
ãã& ,
?
ãã, -
idp
ãã. 1
)
ãã1 2
=>
åå 
UserLogoutCounter
åå  
.
åå  !
Add
åå! $
(
åå$ %
$num
åå% &
,
åå& '
tag
åå( +
:
åå+ ,
new
åå- 0
(
åå0 1
Tags
åå1 5
.
åå5 6
Idp
åå6 9
,
åå9 :
idp
åå; >
)
åå> ?
)
åå? @
;
åå@ A
}
çç 
}éé Ù&
tC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\ServerSideSessions\Index.cshtml.cs
	namespace

 	
EdoAuthServer


 
.

 
UI

 
.

 
Pages

  
.

  !
ServerSideSessions

! 3
{ 
public 

class 

IndexModel 
: 
	PageModel '
{ 
private 
readonly %
ISessionManagementService 2
?2 3%
_sessionManagementService4 M
;M N
public 

IndexModel 
( %
ISessionManagementService 3
?3 4$
sessionManagementService5 M
=N O
nullP T
)T U
{ 	%
_sessionManagementService %
=& '$
sessionManagementService( @
;@ A
} 	
public 
QueryResult 
< 
UserSession &
>& '
?' (
UserSessions) 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public 
string 
? 
DisplayNameFilter (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public 
string 
? 
SessionIdFilter &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public 
string 
? 
SubjectIdFilter &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[   	
BindProperty  	 
(   
SupportsGet   !
=  " #
true  $ (
)  ( )
]  ) *
public!! 
string!! 
?!! 
Token!! 
{!! 
get!! "
;!!" #
set!!$ '
;!!' (
}!!) *
[## 	
BindProperty##	 
(## 
SupportsGet## !
=##" #
true##$ (
)##( )
]##) *
public$$ 
string$$ 
?$$ 
Prev$$ 
{$$ 
get$$ !
;$$! "
set$$# &
;$$& '
}$$( )
public&& 
async&& 
Task&& 
OnGet&& 
(&&  
)&&  !
{'' 	
if(( 
((( %
_sessionManagementService(( )
!=((* ,
null((- 1
)((1 2
{)) 
UserSessions** 
=** 
await** $%
_sessionManagementService**% >
.**> ?
QuerySessionsAsync**? Q
(**Q R
new**R U
SessionQuery**V b
{++ 
ResultsToken,,  
=,,! "
Token,,# (
,,,( )
RequestPriorResults-- '
=--( )
Prev--* .
==--/ 1
$str--2 8
,--8 9
DisplayName.. 
=..  !
DisplayNameFilter.." 3
,..3 4
	SessionId// 
=// 
SessionIdFilter//  /
,/// 0
	SubjectId00 
=00 
SubjectIdFilter00  /
}11 
)11 
;11 
}22 
}33 	
[55 	
BindProperty55	 
]55 
public66 
string66 
?66 
	SessionId66  
{66! "
get66# &
;66& '
set66( +
;66+ ,
}66- .
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' (
OnPost88) /
(88/ 0
)880 1
{99 	!
ArgumentNullException:: !
.::! "
ThrowIfNull::" -
(::- .%
_sessionManagementService::. G
)::G H
;::H I
await<< %
_sessionManagementService<< +
.<<+ ,
RemoveSessionsAsync<<, ?
(<<? @
new<<@ C!
RemoveSessionsContext<<D Y
{<<Z [
	SessionId== 
=== 
	SessionId== %
,==% &
}>> 
)>> 
;>> 
return?? 
RedirectToPage?? !
(??! "
$str??" =
,??= >
new??? B
{??C D
Token??E J
,??J K
DisplayNameFilter??L ]
,??] ^
SessionIdFilter??_ n
,??n o
SubjectIdFilter??p 
,	?? Ä
Prev
??Å Ö
}
??Ü á
)
??á à
;
??à â
}@@ 	
}AA 
}BB ÷ 
mC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\SecurityHeadersAttribute.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
;  !
public		 
sealed		 
class		 $
SecurityHeadersAttribute		 ,
:		- .!
ActionFilterAttribute		/ D
{

 
public 

override 
void 
OnResultExecuting *
(* +"
ResultExecutingContext+ A
contextB I
)I J
{ !
ArgumentNullException 
. 
ThrowIfNull )
() *
context* 1
,1 2
nameof3 9
(9 :
context: A
)A B
)B C
;C D
var 
result 
= 
context 
. 
Result #
;# $
if 

( 
result 
is 

PageResult  
)  !
{ 	
if 
( 
! 
context 
. 
HttpContext $
.$ %
Response% -
.- .
Headers. 5
.5 6
ContainsKey6 A
(A B
$strB Z
)Z [
)[ \
{ 
context 
. 
HttpContext #
.# $
Response$ ,
., -
Headers- 4
.4 5
Append5 ;
(; <
$str< T
,T U
$strV _
)_ `
;` a
} 
if 
( 
! 
context 
. 
HttpContext $
.$ %
Response% -
.- .
Headers. 5
.5 6
ContainsKey6 A
(A B
$strB S
)S T
)T U
{ 
context 
. 
HttpContext #
.# $
Response$ ,
., -
Headers- 4
.4 5
Append5 ;
(; <
$str< M
,M N
$strO U
)U V
;V W
} 
var 
csp 
= 
$str	 ú
;
ú ù
if&& 
(&& 
!&& 
context&& 
.&& 
HttpContext&& $
.&&$ %
Response&&% -
.&&- .
Headers&&. 5
.&&5 6
ContainsKey&&6 A
(&&A B
$str&&B [
)&&[ \
)&&\ ]
{'' 
context(( 
.(( 
HttpContext(( #
.((# $
Response(($ ,
.((, -
Headers((- 4
.((4 5
Append((5 ;
(((; <
$str((< U
,((U V
csp((W Z
)((Z [
;(([ \
})) 
if++ 
(++ 
!++ 
context++ 
.++ 
HttpContext++ $
.++$ %
Response++% -
.++- .
Headers++. 5
.++5 6
ContainsKey++6 A
(++A B
$str++B ]
)++] ^
)++^ _
{,, 
context-- 
.-- 
HttpContext-- #
.--# $
Response--$ ,
.--, -
Headers--- 4
.--4 5
Append--5 ;
(--; <
$str--< W
,--W X
csp--Y \
)--\ ]
;--] ^
}.. 
var11 
referrer_policy11 
=11  !
$str11" /
;11/ 0
if22 
(22 
!22 
context22 
.22 
HttpContext22 $
.22$ %
Response22% -
.22- .
Headers22. 5
.225 6
ContainsKey226 A
(22A B
$str22B S
)22S T
)22T U
{33 
context44 
.44 
HttpContext44 #
.44# $
Response44$ ,
.44, -
Headers44- 4
.444 5
Append445 ;
(44; <
$str44< M
,44M N
referrer_policy44O ^
)44^ _
;44_ `
}55 
}66 	
}77 
}88 ä

jC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Redirect\Index.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Redirect! )
;) *
[

 
AllowAnonymous

 
]

 
public 
class 

IndexModel 
: 
	PageModel #
{ 
public 

string 
? 
RedirectUri 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

IActionResult 
OnGet 
( 
string %
?% &
redirectUri' 2
)2 3
{ 
if 

( 
! 
Url 
. 

IsLocalUrl 
( 
redirectUri '
)' (
)( )
{ 	
return 
RedirectToPage !
(! "
$str" 5
)5 6
;6 7
} 	
RedirectUri 
= 
redirectUri !
;! "
return 
Page 
( 
) 
; 
} 
} Ù9
XC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Log.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
;  !
internal 
static	 
class 
Log 
{ 
private 
static	 
readonly 
Action 
<  
ILogger  '
,' (
string) /
?/ 0
,0 1
	Exception2 ;
?; <
>< =

_invalidId> H
=I J
LoggerMessageK X
.X Y
DefineY _
<_ `
string` f
?f g
>g h
(h i
LogLevel		 
.		 
Error		 
,		 
EventIds

 
.

 
	InvalidId

 
,

 
$str 
) 
; 
public 

static 
void 
	InvalidId  
(  !
this! %
ILogger& -
logger. 4
,4 5
string6 <
?< =
id> @
)@ A
{ 

_invalidId 
( 
logger 
, 
id 
, 
null #
)# $
;$ %
} 
private 
static	 
readonly 
Action 
<  
ILogger  '
,' (
string) /
?/ 0
,0 1
	Exception2 ;
?; <
>< =&
_invalidBackchannelLoginId> X
=Y Z
LoggerMessage[ h
.h i
Definei o
<o p
stringp v
?v w
>w x
(x y
LogLevel 	
.	 

Warning
 
, 
EventIds 	
.	 
%
InvalidBackchannelLoginId
 #
,# $
$str $
)$ %
;% &
public 
static 
void %
InvalidBackchannelLoginId -
(- .
this. 2
ILogger3 :
logger; A
,A B
stringC I
?I J
idK M
)M N
{ &
_invalidBackchannelLoginId 
( 
logger #
,# $
id% '
,' (
null) -
)- .
;. /
} 
private 
static	 
Action 
< 
ILogger 
, 
IEnumerable  +
<+ ,
string, 2
>2 3
,3 4
	Exception5 >
?> ?
>? @
_externalClaimsA P
=Q R
LoggerMessageS `
.` a
Definea g
<g h
IEnumerableh s
<s t
stringt z
>z {
>{ |
(| }
LogLevel 

.
 
Debug 
, 
EventIds 

.
 
ExternalClaims 
, 
$str 
) 
; 
public!! 
static!! 
void!! 
ExternalClaims!! "
(!!" #
this!!# '
ILogger!!( /
logger!!0 6
,!!6 7
IEnumerable!!8 C
<!!C D
string!!D J
>!!J K
claims!!L R
)!!R S
{"" 
_externalClaims## 
(## 
logger## 
,## 
claims##  
,##  !
null##" &
)##& '
;##' (
}$$ 
private&& 
static&&	 
Action&& 
<&& 
ILogger&& 
,&& 
string&&  &
,&&& '
	Exception&&( 1
?&&1 2
>&&2 3.
"_noMatchingBackchannelLoginRequest&&4 V
=&&W X
LoggerMessage&&Y f
.&&f g
Define&&g m
<&&m n
string&&n t
>&&t u
(&&u v
LogLevel'' 

.''
 
Error'' 
,'' 
EventIds(( 

.((
 -
!NoMatchingBackchannelLoginRequest(( ,
,((, -
$str)) 2
)))2 3
;))3 4
public++ 
static++ 
void++ -
!NoMatchingBackchannelLoginRequest++ 5
(++5 6
this++6 :
ILogger++; B
logger++C I
,++I J
string++K Q
id++R T
)++T U
{,, .
"_noMatchingBackchannelLoginRequest-- $
(--$ %
logger--% +
,--+ ,
id--- /
,--/ 0
null--1 5
)--5 6
;--6 7
}.. 
private00 
static00	 
Action00 
<00 
ILogger00 
,00 
string00  &
,00& '
	Exception00( 1
?001 2
>002 3%
_noConsentMatchingRequest004 M
=00N O
LoggerMessage00P ]
.00] ^
Define00^ d
<00d e
string00e k
>00k l
(00l m
LogLevel11 

.11
 
Error11 
,11 
EventIds22 

.22
 $
NoConsentMatchingRequest22 #
,22# $
$str33 4
)334 5
;335 6
public55 
static55 
void55 $
NoConsentMatchingRequest55 ,
(55, -
this55- 1
ILogger552 9
logger55: @
,55@ A
string55B H
	returnUrl55I R
)55R S
{66 %
_noConsentMatchingRequest77 
(77 
logger77 "
,77" #
	returnUrl77$ -
,77- .
null77/ 3
)773 4
;774 5
}88 
};; 
internal== 
static==	 
class== 
EventIds== 
{>> 
private?? 
const??	 
int?? 
UIEventsStart??  
=??! "
$num??# (
;??( )
privateDD 
constDD 
intDD 
ConsentEventsStartDD (
=DD) *
UIEventsStartDD+ 8
+DD9 :
$numDD; ?
;DD? @
publicEE 

constEE 
intEE 
	InvalidIdEE 
=EE  
ConsentEventsStartEE! 3
+EE4 5
$numEE6 7
;EE7 8
publicFF 
constFF 
intFF $
NoConsentMatchingRequestFF *
=FF+ ,
ConsentEventsStartFF- ?
+FF@ A
$numFFB C
;FFC D
privateKK 
constKK	 
intKK $
ExternalLoginEventsStartKK +
=KK, -
UIEventsStartKK. ;
+KK< =
$numKK> B
;KKB C
publicLL 

constLL 
intLL 
ExternalClaimsLL #
=LL$ %$
ExternalLoginEventsStartLL& >
+LL? @
$numLLA B
;LLB C
privateQQ 
constQQ	 
intQQ 
CibaEventsStartQQ "
=QQ# $
UIEventsStartQQ% 2
+QQ3 4
$numQQ5 9
;QQ9 :
publicRR 
constRR 
intRR %
InvalidBackchannelLoginIdRR +
=RR, -
CibaEventsStartRR. =
+RR> ?
$numRR@ A
;RRA B
publicSS 

constSS 
intSS -
!NoMatchingBackchannelLoginRequestSS 6
=SS7 8
CibaEventsStartSS9 H
+SSI J
$numSSK L
;SSL M
}WW §

aC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Index.cshtml.cs
	namespace		 	
EdoAuthServer		
 
.		 
UI		 
.		 
Pages		  
.		  !
Home		! %
;		% &
[ 
AllowAnonymous 
] 
public 
class 
Index 
: 
	PageModel 
{ 
public 

Index 
( 
) 
{ 
} 
public 

string 
Version 
{ 
get 
=> 
typeof 
( 
Duende 
. 
IdentityServer +
.+ ,
Hosting, 3
.3 4$
IdentityServerMiddleware4 L
)L M
.M N
AssemblyN V
. 
GetCustomAttribute 
<  1
%AssemblyInformationalVersionAttribute  E
>E F
(F G
)G H
? 
.  
InformationalVersion "
." #
Split# (
(( )
$char) ,
), -
.- .
First. 3
(3 4
)4 5
?? 
$str 
; 
} 
}## Ú
oC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\IdentityServerSuppressions.cs
[ 
assembly 	
:	 

SuppressMessage 
( 
$str #
,# $
$str% W
,W X
JustificationY f
=g h
$str	i í
)
í ì
]
ì î
[ 
assembly 	
:	 

SuppressMessage 
( 
$str #
,# $
$str% W
,W X
JustificationY f
=g h
$str	i í
)
í ì
]
ì î
[ 
assembly 	
:	 

SuppressMessage 
( 
$str (
,( )
$str* f
,f g
Justificationh u
=v w
$str	x ›
)
› ﬁ
]
ﬁ ﬂ
[ 
assembly 	
:	 

SuppressMessage 
( 
$str #
,# $
$str% I
,I J
JustificationK X
=Y Z
$str	[ Ü
,
Ü á
Scope
à ç
=
é è
$str
ê ò
,
ò ô
Target
ö †
=
° ¢
$str
£ »
)
» …
]
…  
[ 
assembly 	
:	 

SuppressMessage 
( 
$str #
,# $
$str% P
,P Q
JustificationR _
=` a
$str	b à
,
à â
Scope
ä è
=
ê ë
$str
í ò
,
ò ô
Target
ö †
=
° ¢
$str
£ ﬂ
)
ﬂ ‡
]
‡ ·
[ 
assembly 	
:	 

SuppressMessage 
( 
$str #
,# $
$str% S
,S T
JustificationU b
=c d
$str	e ±
,
± ≤
Scope
≥ ∏
=
π ∫
$str
ª ∆
,
∆ «
Target
» Œ
=
œ –
$str
— Ú
)
Ú Û
]
Û Ù
[ 
assembly 	
:	 

SuppressMessage 
( 
$str #
,# $
$str% T
,T U
JustificationV c
=d e
$str	f «
,
« »
Scope
… Œ
=
œ –
$str
— ◊
,
◊ ÿ
Target
Ÿ ﬂ
=
‡ ·
$str
‚ ä
)
ä ã
]
ã å
[ 
assembly 	
:	 

SuppressMessage 
( 
$str #
,# $
$str% T
,T U
JustificationV c
=d e
$str	f «
,
« »
Scope
… Œ
=
œ –
$str
— ◊
,
◊ ÿ
Target
Ÿ ﬂ
=
‡ ·
$str
‚ à
)
à â
]
â ä
[ 
assembly 	
:	 

SuppressMessage 
( 
$str (
,( )
$str* R
,R S
JustificationT a
=b c
$str	d £
,
£ §
Scope
• ™
=
´ ¨
$str
≠ µ
,
µ ∂
Target
∑ Ω
=
æ ø
$str
¿ é
)
é è
]
è êµ
iC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Home\Error\ViewModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Error! &
;& '
public 
class 
	ViewModel 
{		 
public

 

	ViewModel

 
(

 
)

 
{ 
} 
public 

	ViewModel 
( 
string 
error !
)! "
{ 
Error 
= 
new 
ErrorMessage  
{! "
Error# (
=) *
error+ 0
}1 2
;2 3
} 
public 

ErrorMessage 
? 
Error 
{  
get! $
;$ %
set& )
;) *
}+ ,
} ù
lC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Home\Error\Index.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Error! &
;& '
[

 
AllowAnonymous

 
]

 
[ 
SecurityHeaders 
] 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IWebHostEnvironment (
_environment) 5
;5 6
public 

	ViewModel 
View 
{ 
get 
;  
set! $
;$ %
}& '
=( )
new* -
(- .
). /
;/ 0
public 

Index 
( -
!IIdentityServerInteractionService 2
interaction3 >
,> ?
IWebHostEnvironment@ S
environmentT _
)_ `
{ 
_interaction 
= 
interaction "
;" #
_environment 
= 
environment "
;" #
} 
public 

async 
Task 
OnGet 
( 
string "
?" #
errorId$ +
)+ ,
{ 
var 
message 
= 
await 
_interaction (
.( ) 
GetErrorContextAsync) =
(= >
errorId> E
)E F
;F G
if 

( 
message 
!= 
null 
) 
{ 	
View 
. 
Error 
= 
message  
;  !
if!! 
(!! 
!!! 
_environment!! 
.!! 
IsDevelopment!! +
(!!+ ,
)!!, -
)!!- .
{"" 
message$$ 
.$$ 
ErrorDescription$$ (
=$$) *
null$$+ /
;$$/ 0
}%% 
}&& 	
}'' 
}(( Ù
eC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Grants\ViewModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Grants! '
;' (
public 
class 
	ViewModel 
{ 
public 

IEnumerable 
< 
GrantViewModel %
>% &
Grants' -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
=< =

Enumerable> H
.H I
EmptyI N
<N O
GrantViewModelO ]
>] ^
(^ _
)_ `
;` a
}		 
public 
class 
GrantViewModel 
{ 
public 

string 
? 
ClientId 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
? 

ClientName 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
? 
	ClientUrl 
{ 
get "
;" #
set$ '
;' (
}) *
public 

string 
? 
ClientLogoUrl  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

DateTime 
Created 
{ 
get !
;! "
set# &
;& '
}( )
public 

DateTime 
? 
Expires 
{ 
get "
;" #
set$ '
;' (
}) *
public 

IEnumerable 
< 
string 
> 
IdentityGrantNames 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
=@ A

EnumerableB L
.L M
EmptyM R
<R S
stringS Y
>Y Z
(Z [
)[ \
;\ ]
public 

IEnumerable 
< 
string 
> 
ApiGrantNames ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
=; <

Enumerable= G
.G H
EmptyH M
<M N
stringN T
>T U
(U V
)V W
;W X
} ï2
hC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Grants\Index.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Grants! '
;' (
[ 
SecurityHeaders 
] 
[ 
	Authorize 

]
 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IClientStore !
_clients" *
;* +
private 
readonly 
IResourceStore #

_resources$ .
;. /
private 
readonly 
IEventService "
_events# *
;* +
public 

Index 
( -
!IIdentityServerInteractionService 2
interaction3 >
,> ?
IClientStore 
clients 
, 
IResourceStore 
	resources  
,  !
IEventService 
events 
) 
{ 
_interaction 
= 
interaction "
;" #
_clients 
= 
clients 
; 

_resources 
= 
	resources 
; 
_events 
= 
events 
; 
}   
public"" 

	ViewModel"" 
View"" 
{"" 
get"" 
;""  
set""! $
;""$ %
}""& '
=""( )
default""* 1
!""1 2
;""2 3
public$$ 

async$$ 
Task$$ 
OnGet$$ 
($$ 
)$$ 
{%% 
var&& 
grants&& 
=&& 
await&& 
_interaction&& '
.&&' (!
GetAllUserGrantsAsync&&( =
(&&= >
)&&> ?
;&&? @
var(( 
list(( 
=(( 
new(( 
List(( 
<(( 
GrantViewModel(( *
>((* +
(((+ ,
)((, -
;((- .
foreach)) 
()) 
var)) 
grant)) 
in)) 
grants)) $
)))$ %
{** 	
var++ 
client++ 
=++ 
await++ 
_clients++ '
.++' (
FindClientByIdAsync++( ;
(++; <
grant++< A
.++A B
ClientId++B J
)++J K
;++K L
if,, 
(,, 
client,, 
!=,, 
null,, 
),, 
{-- 
var.. 
	resources.. 
=.. 
await..  %

_resources..& 0
...0 1%
FindResourcesByScopeAsync..1 J
(..J K
grant..K P
...P Q
Scopes..Q W
)..W X
;..X Y
var00 
item00 
=00 
new00 
GrantViewModel00 -
(00- .
)00. /
{11 
ClientId22 
=22 
client22 %
.22% &
ClientId22& .
,22. /

ClientName33 
=33  
client33! '
.33' (

ClientName33( 2
??333 5
client336 <
.33< =
ClientId33= E
,33E F
ClientLogoUrl44 !
=44" #
client44$ *
.44* +
LogoUri44+ 2
,442 3
	ClientUrl55 
=55 
client55  &
.55& '
	ClientUri55' 0
,550 1
Description66 
=66  !
grant66" '
.66' (
Description66( 3
,663 4
Created77 
=77 
grant77 #
.77# $
CreationTime77$ 0
,770 1
Expires88 
=88 
grant88 #
.88# $

Expiration88$ .
,88. /
IdentityGrantNames99 &
=99' (
	resources99) 2
.992 3
IdentityResources993 D
.99D E
Select99E K
(99K L
x99L M
=>99N P
x99Q R
.99R S
DisplayName99S ^
??99_ a
x99b c
.99c d
Name99d h
)99h i
.99i j
ToArray99j q
(99q r
)99r s
,99s t
ApiGrantNames:: !
=::" #
	resources::$ -
.::- .
	ApiScopes::. 7
.::7 8
Select::8 >
(::> ?
x::? @
=>::A C
x::D E
.::E F
DisplayName::F Q
??::R T
x::U V
.::V W
Name::W [
)::[ \
.::\ ]
ToArray::] d
(::d e
)::e f
};; 
;;; 
list== 
.== 
Add== 
(== 
item== 
)== 
;== 
}>> 
}?? 	
ViewAA 
=AA 
newAA 
	ViewModelAA 
{BB 	
GrantsCC 
=CC 
listCC 
}DD 	
;DD	 

}EE 
[GG 
BindPropertyGG 
]GG 
publicHH 

stringHH 
?HH 
ClientIdHH 
{HH 
getHH !
;HH! "
setHH# &
;HH& '
}HH( )
publicJJ 

asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ #
>JJ# $
OnPostJJ% +
(JJ+ ,
)JJ, -
{KK 
awaitLL 
_interactionLL 
.LL "
RevokeUserConsentAsyncLL 1
(LL1 2
ClientIdLL2 :
)LL: ;
;LL; <
awaitMM 
_eventsMM 
.MM 

RaiseAsyncMM  
(MM  !
newMM! $
GrantsRevokedEventMM% 7
(MM7 8
UserMM8 <
.MM< =
GetSubjectIdMM= I
(MMI J
)MMJ K
,MMK L
ClientIdMMM U
)MMU V
)MMV W
;MMW X
	TelemetryNN 
.NN 
MetricsNN 
.NN 
GrantsRevokedNN '
(NN' (
ClientIdNN( 0
)NN0 1
;NN1 2
returnPP 
RedirectToPagePP 
(PP 
$strPP -
)PP- .
;PP. /
}QQ 
}RR €
sC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\ExternalLogin\Challenge.cshtml.cs
	namespace

 	
EdoAuthServer


 
.

 
UI

 
.

 
Pages

  
.

  !
ExternalLogin

! .
;

. /
[ 
AllowAnonymous 
] 
[ 
SecurityHeaders 
] 
public 
class 
	Challenge 
: 
	PageModel "
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interactionService7 J
;J K
public 

	Challenge 
( -
!IIdentityServerInteractionService 6
interactionService7 I
)I J
{ 
_interactionService 
= 
interactionService 0
;0 1
} 
public 

IActionResult 
OnGet 
( 
string %
scheme& ,
,, -
string. 4
?4 5
	returnUrl6 ?
)? @
{ 
if 

( 
string 
. 
IsNullOrEmpty  
(  !
	returnUrl! *
)* +
)+ ,
	returnUrl- 6
=7 8
$str9 =
;= >
if 

( 
Url 
. 

IsLocalUrl 
( 
	returnUrl $
)$ %
==& (
false) .
&&/ 1
_interactionService2 E
.E F
IsValidReturnUrlF V
(V W
	returnUrlW `
)` a
==b d
falsee j
)j k
{ 	
throw 
new 
ArgumentException '
(' (
$str( <
)< =
;= >
}   	
var## 
props## 
=## 
new## $
AuthenticationProperties## 0
{$$ 	
RedirectUri%% 
=%% 
Url%% 
.%% 
Page%% "
(%%" #
$str%%# <
)%%< =
,%%= >
Items'' 
='' 
{(( 
{)) 
$str)) 
,)) 
	returnUrl)) (
}))) *
,))* +
{** 
$str** 
,** 
scheme** "
}**# $
,**$ %
}++ 
},, 	
;,,	 

return.. 
	Challenge.. 
(.. 
props.. 
,.. 
scheme..  &
)..& '
;..' (
}// 
}00 »-
rC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\ExternalLogin\Callback.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
ExternalLogin! .
{ 
[ 
SecurityHeaders 
] 
[ 
AllowAnonymous 
] 
public 

class 
Callback 
: 
	PageModel %
{ 
private 
readonly -
!IIdentityServerInteractionService :
_interaction; G
;G H
private 
readonly 
IEventService &
_events' .
;. /
private 
readonly 
SignInManager &
<& '
ApplicationUser' 6
>6 7
_signInManager8 F
;F G
private 
readonly 
UserManager $
<$ %
ApplicationUser% 4
>4 5
_userManager6 B
;B C
public 
Callback 
( -
!IIdentityServerInteractionService -
interaction. 9
,9 :
IEventService 
events  
,  !
SignInManager 
< 
ApplicationUser )
>) *
signInManager+ 8
,8 9
UserManager   
<   
ApplicationUser   '
>  ' (
userManager  ) 4
)  4 5
{!! 	
_interaction"" 
="" 
interaction"" &
;""& '
_events## 
=## 
events## 
;## 
_signInManager$$ 
=$$ 
signInManager$$ *
;$$* +
_userManager%% 
=%% 
userManager%% &
;%%& '
}&& 	
public(( 
async(( 
Task(( 
<(( 
IActionResult(( '
>((' (
OnGet(() .
(((. /
)((/ 0
{)) 	
var++ 
result++ 
=++ 
await++ 
HttpContext++ *
.++* +
AuthenticateAsync+++ <
(++< =#
IdentityServerConstants++= T
.++T U.
"ExternalCookieAuthenticationScheme++U w
)++w x
;++x y
if,, 
(,, 
result,, 
?,, 
.,, 
	Succeeded,, !
!=,," $
true,,% )
),,) *
throw-- 
new-- 
	Exception-- #
(--# $
$str--$ D
)--D E
;--E F
var// 
externalUser// 
=// 
result// %
.//% &
	Principal//& /
;/// 0
var00 
externalUserId00 
=00  
externalUser00! -
.00- .
	FindFirst00. 7
(007 8

ClaimTypes008 B
.00B C
NameIdentifier00C Q
)00Q R
?00R S
.00S T
Value00T Y
;00Y Z
var33 
email33 
=33 
externalUser33 $
.33$ %
	FindFirst33% .
(33. /

ClaimTypes33/ 9
.339 :
Email33: ?
)33? @
?33@ A
.33A B
Value33B G
;33G H
var44 
username44 
=44 
externalUser44 '
.44' (
Identity44( 0
?440 1
.441 2
Name442 6
??447 9
email44: ?
;44? @
var66 
user66 
=66 
await66 
_userManager66 )
.66) *
FindByNameAsync66* 9
(669 :
username66: B
)66B C
;66C D
if77 
(77 
user77 
==77 
null77 
)77 
{88 
user99 
=99 
new99 
ApplicationUser99 *
{:: 
UserName;; 
=;; 
username;; '
,;;' (
Email<< 
=<< 
email<< !
,<<! "
FullName== 
=== 
externalUser== +
.==+ ,
	FindFirst==, 5
(==5 6
$str==6 <
)==< =
?=== >
.==> ?
Value==? D
??==E G
username==H P
}>> 
;>> 
await@@ 
_userManager@@ "
.@@" #
CreateAsync@@# .
(@@. /
user@@/ 3
)@@3 4
;@@4 5
}AA 
awaitCC 
_signInManagerCC  
.CC  !
SignInAsyncCC! ,
(CC, -
userCC- 1
,CC1 2
isPersistentCC3 ?
:CC? @
falseCCA F
)CCF G
;CCG H
awaitEE 
HttpContextEE 
.EE 
SignOutAsyncEE *
(EE* +#
IdentityServerConstantsEE+ B
.EEB C.
"ExternalCookieAuthenticationSchemeEEC e
)EEe f
;EEf g
varGG 
	returnUrlGG 
=GG 
resultGG "
.GG" #

PropertiesGG# -
.GG- .
ItemsGG. 3
[GG3 4
$strGG4 ?
]GG? @
??GGA C
$strGGD H
;GGH I
varHH 
contextHH 
=HH 
awaitHH 
_interactionHH  ,
.HH, -(
GetAuthorizationContextAsyncHH- I
(HHI J
	returnUrlHHJ S
)HHS T
;HHT U
ifJJ 
(JJ 
contextJJ 
!=JJ 
nullJJ 
)JJ  
{KK 
returnLL 
RedirectLL 
(LL  
	returnUrlLL  )
)LL) *
;LL* +
}MM 
returnOO 
RedirectOO 
(OO 
$strOO  
)OO  !
;OO! "
}PP 	
}QQ 
}RR Ü
_C:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Extensions.cs
	namespace		 	
EdoAuthServer		
 
.		 
UI		 
.		 
Pages		  
;		  !
public 
static 
class 

Extensions 
{ 
internal 
static 
async 
Task 
< 
bool #
># $)
GetSchemeSupportsSignOutAsync% B
(B C
thisC G
HttpContextH S
contextT [
,[ \
string] c
schemed j
)j k
{ 
var 
provider 
= 
context 
. 
RequestServices .
.. /
GetRequiredService/ A
<A B*
IAuthenticationHandlerProviderB `
>` a
(a b
)b c
;c d
var 
handler 
= 
await 
provider $
.$ %
GetHandlerAsync% 4
(4 5
context5 <
,< =
scheme> D
)D E
;E F
return 
( 
handler 
is )
IAuthenticationSignOutHandler 8
)8 9
;9 :
} 
internal 
static 
bool 
IsNativeClient '
(' (
this( , 
AuthorizationRequest- A
contextB I
)I J
{ 
return 
! 
context 
. 
RedirectUri #
.# $

StartsWith$ .
(. /
$str/ 6
,6 7
StringComparison8 H
.H I
OrdinalI P
)P Q
&& 
! 
context 
. 
RedirectUri &
.& '

StartsWith' 1
(1 2
$str2 8
,8 9
StringComparison: J
.J K
OrdinalK R
)R S
;S T
} 
internal## 
static## 
IActionResult## !
LoadingPage##" -
(##- .
this##. 2
	PageModel##3 <
page##= A
,##A B
string##C I
?##I J
redirectUri##K V
)##V W
{$$ 
page%% 
.%% 
HttpContext%% 
.%% 
Response%% !
.%%! "

StatusCode%%" ,
=%%- .
$num%%/ 2
;%%2 3
page&& 
.&& 
HttpContext&& 
.&& 
Response&& !
.&&! "
Headers&&" )
[&&) *
$str&&* 4
]&&4 5
=&&6 7
$str&&8 :
;&&: ;
return(( 
page(( 
.(( 
RedirectToPage(( "
(((" #
$str((# 4
,((4 5
new((6 9
{((: ;
RedirectUri((< G
=((H I
redirectUri((J U
}((V W
)((W X
;((X Y
})) 
}** ñ
jC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Diagnostics\ViewModel.cs
	namespace		 	
EdoAuthServer		
 
.		 
UI		 
.		 
Pages		  
.		  !
Diagnostics		! ,
;		, -
public 
class 
	ViewModel 
{ 
public 

	ViewModel 
( 
AuthenticateResult '
result( .
). /
{ 
AuthenticateResult 
= 
result #
;# $
if 

( 
result 
? 
. 

Properties 
? 
.  
Items  %
.% &
TryGetValue& 1
(1 2
$str2 ?
,? @
outA D
varE H
encodedI P
)P Q
==R T
trueU Y
)Y Z
{ 	
if 
( 
encoded 
!= 
null 
)  
{ 
var 
bytes 
= 
	Base64Url %
.% &
Decode& ,
(, -
encoded- 4
)4 5
;5 6
var 
value 
= 
Encoding $
.$ %
UTF8% )
.) *
	GetString* 3
(3 4
bytes4 9
)9 :
;: ;
Clients 
= 
JsonSerializer (
.( )
Deserialize) 4
<4 5
string5 ;
[; <
]< =
>= >
(> ?
value? D
)D E
??F H

EnumerableI S
.S T
EmptyT Y
<Y Z
stringZ `
>` a
(a b
)b c
;c d
return 
; 
} 
} 	
Clients 
= 

Enumerable 
. 
Empty "
<" #
string# )
>) *
(* +
)+ ,
;, -
} 
public 

AuthenticateResult 
AuthenticateResult 0
{1 2
get3 6
;6 7
}8 9
public 

IEnumerable 
< 
string 
> 
Clients &
{' (
get) ,
;, -
}. /
}   ô
mC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Diagnostics\Index.cshtml.cs
	namespace		 	
EdoAuthServer		
 
.		 
UI		 
.		 
Pages		  
.		  !
Diagnostics		! ,
;		, -
[ 
SecurityHeaders 
] 
[ 
	Authorize 

]
 
public 
class 
Index 
: 
	PageModel 
{ 
public 

	ViewModel 
View 
{ 
get 
;  
set! $
;$ %
}& '
=( )
default* 1
!1 2
;2 3
public 

async 
Task 
< 
IActionResult #
># $
OnGet% *
(* +
)+ ,
{ 
var 
localAddresses 
= 
new  
List! %
<% &
string& ,
?, -
>- .
{/ 0
$str1 <
,< =
$str> C
}D E
;E F
if 

(
 
HttpContext 
. 

Connection !
.! "
LocalIpAddress" 0
!=1 3
null4 8
)8 9
{ 	
localAddresses 
. 
Add 
( 
HttpContext *
.* +

Connection+ 5
.5 6
LocalIpAddress6 D
.D E
ToStringE M
(M N
)N O
)O P
;P Q
} 	
if 

( 
! 
localAddresses 
. 
Contains $
($ %
HttpContext% 0
.0 1

Connection1 ;
.; <
RemoteIpAddress< K
?K L
.L M
ToStringM U
(U V
)V W
)W X
)X Y
{ 	
return 
NotFound 
( 
) 
; 
} 	
View 
= 
new 
	ViewModel 
( 
await "
HttpContext# .
.. /
AuthenticateAsync/ @
(@ A
)A B
)B C
;C D
return   
Page   
(   
)   
;   
}!! 
}"" Ÿ
eC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Device\ViewModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Device! '
;' (
public 
class 
	ViewModel 
{ 
public 

string 
? 

ClientName 
{ 
get  #
;# $
set% (
;( )
}* +
public		 

string		 
?		 
	ClientUrl		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 

string

 
?

 
ClientLogoUrl

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 

bool  
AllowRememberConsent $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 

IEnumerable 
< 
ScopeViewModel %
>% &
IdentityScopes' 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
=D E

EnumerableF P
.P Q
EmptyQ V
<V W
ScopeViewModelW e
>e f
(f g
)g h
;h i
public 

IEnumerable 
< 
ScopeViewModel %
>% &
	ApiScopes' 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
=? @

EnumerableA K
.K L
EmptyL Q
<Q R
ScopeViewModelR `
>` a
(a b
)b c
;c d
} 
public 
class 
ScopeViewModel 
{ 
public 

string 
? 
Value 
{ 
get 
; 
set  #
;# $
}% &
public 

string 
? 
DisplayName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

bool 
	Emphasize 
{ 
get 
;  
set! $
;$ %
}& '
public 

bool 
Required 
{ 
get 
; 
set  #
;# $
}% &
public 

bool 
Checked 
{ 
get 
; 
set "
;" #
}$ %
} Ô
jC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Device\Success.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Device! '
;' (
[		 
SecurityHeaders		 
]		 
[

 
	Authorize

 

]


 
public 
class 
SuccessModel 
: 
	PageModel %
{ 
public 

void 
OnGet 
( 
) 
{ 
} 
} Ã
fC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Device\InputModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Device! '
;' (
public 
class 

InputModel 
{ 
public 

string 
? 
Button 
{ 
get 
;  
set! $
;$ %
}& '
public		 

IEnumerable		 
<		 
string		 
>		 
ScopesConsented		 .
{		/ 0
get		1 4
;		4 5
set		6 9
;		9 :
}		; <
=		= >
new		? B
List		C G
<		G H
string		H N
>		N O
(		O P
)		P Q
;		Q R
public

 

bool

 
RememberConsent

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
=

. /
true

0 4
;

4 5
public 

string 
? 
	ReturnUrl 
{ 
get "
;" #
set$ '
;' (
}) *
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string 
? 
UserCode 
{ 
get !
;! "
set# &
;& '
}( )
} ÿ°
hC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Device\Index.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Device! '
;' (
[ 
SecurityHeaders 
] 
[ 
	Authorize 

]
 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly )
IDeviceFlowInteractionService 2
_interaction3 ?
;? @
private 
readonly 
IEventService "
_events# *
;* +
private 
readonly 
IOptions 
< !
IdentityServerOptions 3
>3 4
_options5 =
;= >
private 
readonly 
ILogger 
< 
Index "
>" #
_logger$ +
;+ ,
public 

Index 
( )
IDeviceFlowInteractionService %
interaction& 1
,1 2
IEventService 
eventService "
," #
IOptions 
< !
IdentityServerOptions &
>& '
options( /
,/ 0
ILogger 
< 
Index 
> 
logger 
) 
{   
_interaction!! 
=!! 
interaction!! "
;!!" #
_events"" 
="" 
eventService"" 
;"" 
_options## 
=## 
options## 
;## 
_logger$$ 
=$$ 
logger$$ 
;$$ 
}%% 
public'' 

	ViewModel'' 
View'' 
{'' 
get'' 
;''  
set''! $
;''$ %
}''& '
=''( )
default''* 1
!''1 2
;''2 3
[)) 
BindProperty)) 
])) 
public** 


InputModel** 
Input** 
{** 
get** !
;**! "
set**# &
;**& '
}**( )
=*** +
default**, 3
!**3 4
;**4 5
public,, 

async,, 
Task,, 
<,, 
IActionResult,, #
>,,# $
OnGet,,% *
(,,* +
string,,+ 1
?,,1 2
userCode,,3 ;
),,; <
{-- 
if.. 

(.. 
String.. 
... 
IsNullOrWhiteSpace.. %
(..% &
userCode..& .
)... /
)../ 0
{// 	
return00 
Page00 
(00 
)00 
;00 
}11 	
if33 

(33 
!33 
await33 
SetViewModelAsync33 $
(33$ %
userCode33% -
)33- .
)33. /
{44 	

ModelState55 
.55 
AddModelError55 $
(55$ %
$str55% '
,55' (
DeviceOptions55) 6
.556 7
InvalidUserCode557 F
)55F G
;55G H
return66 
Page66 
(66 
)66 
;66 
}77 	
Input99 
=99 
new99 

InputModel99 
{99  
UserCode:: 
=:: 
userCode:: 
,::  
};; 	
;;;	 

return== 
Page== 
(== 
)== 
;== 
}>> 
public@@ 

async@@ 
Task@@ 
<@@ 
IActionResult@@ #
>@@# $
OnPost@@% +
(@@+ ,
)@@, -
{AA 
varBB 
requestBB 
=BB 
awaitBB 
_interactionBB (
.BB( )(
GetAuthorizationContextAsyncBB) E
(BBE F
InputBBF K
.BBK L
UserCodeBBL T
??BBU W
throwBBX ]
newBB^ a!
ArgumentNullExceptionBBb w
(BBw x
nameofBBx ~
(BB~ 
Input	BB Ñ
.
BBÑ Ö
UserCode
BBÖ ç
)
BBç é
)
BBé è
)
BBè ê
;
BBê ë
ifCC 

(CC 
requestCC 
==CC 
nullCC 
)CC 
returnCC #
RedirectToPageCC$ 2
(CC2 3
$strCC3 F
)CCF G
;CCG H
ConsentResponseEE 
?EE 
grantedConsentEE '
=EE( )
nullEE* .
;EE. /
ifHH 

(HH 
InputHH 
.HH 
ButtonHH 
==HH 
$strHH  
)HH  !
{II 	
grantedConsentJJ 
=JJ 
newJJ  
ConsentResponseJJ! 0
{KK 
ErrorLL 
=LL 
AuthorizationErrorLL *
.LL* +
AccessDeniedLL+ 7
}MM 
;MM 
awaitPP 
_eventsPP 
.PP 

RaiseAsyncPP $
(PP$ %
newPP% (
ConsentDeniedEventPP) ;
(PP; <
UserPP< @
.PP@ A
GetSubjectIdPPA M
(PPM N
)PPN O
,PPO P
requestPPQ X
.PPX Y
ClientPPY _
.PP_ `
ClientIdPP` h
,PPh i
requestPPj q
.PPq r
ValidatedResources	PPr Ñ
.
PPÑ Ö
RawScopeValues
PPÖ ì
)
PPì î
)
PPî ï
;
PPï ñ
	TelemetryQQ 
.QQ 
MetricsQQ 
.QQ 
ConsentDeniedQQ +
(QQ+ ,
requestQQ, 3
.QQ3 4
ClientQQ4 :
.QQ: ;
ClientIdQQ; C
,QQC D
requestQQE L
.QQL M
ValidatedResourcesQQM _
.QQ_ `
ParsedScopesQQ` l
.QQl m
SelectQQm s
(QQs t
sQQt u
=>QQv x
sQQy z
.QQz {

ParsedName	QQ{ Ö
)
QQÖ Ü
)
QQÜ á
;
QQá à
}RR 	
elseTT 
ifTT 
(TT 
InputTT 
.TT 
ButtonTT 
==TT  
$strTT! &
)TT& '
{UU 	
ifWW 
(WW 
InputWW 
.WW 
ScopesConsentedWW %
.WW% &
AnyWW& )
(WW) *
)WW* +
)WW+ ,
{XX 
varYY 
scopesYY 
=YY 
InputYY "
.YY" #
ScopesConsentedYY# 2
;YY2 3
ifZZ 
(ZZ 
ConsentOptionsZZ "
.ZZ" #
EnableOfflineAccessZZ# 6
==ZZ7 9
falseZZ: ?
)ZZ? @
{[[ 
scopes\\ 
=\\ 
scopes\\ #
.\\# $
Where\\$ )
(\\) *
x\\* +
=>\\, .
x\\/ 0
!=\\1 3
Duende\\4 :
.\\: ;
IdentityServer\\; I
.\\I J#
IdentityServerConstants\\J a
.\\a b
StandardScopes\\b p
.\\p q
OfflineAccess\\q ~
)\\~ 
;	\\ Ä
}]] 
grantedConsent__ 
=__  
new__! $
ConsentResponse__% 4
{`` 
RememberConsentaa #
=aa$ %
Inputaa& +
.aa+ ,
RememberConsentaa, ;
,aa; <!
ScopesValuesConsentedbb )
=bb* +
scopesbb, 2
.bb2 3
ToArraybb3 :
(bb: ;
)bb; <
,bb< =
Descriptioncc 
=cc  !
Inputcc" '
.cc' (
Descriptioncc( 3
}dd 
;dd 
awaitgg 
_eventsgg 
.gg 

RaiseAsyncgg (
(gg( )
newgg) ,
ConsentGrantedEventgg- @
(gg@ A
UserggA E
.ggE F
GetSubjectIdggF R
(ggR S
)ggS T
,ggT U
requestggV ]
.gg] ^
Clientgg^ d
.ggd e
ClientIdgge m
,ggm n
requestggo v
.ggv w
ValidatedResources	ggw â
.
ggâ ä
RawScopeValues
ggä ò
,
ggò ô
grantedConsent
ggö ®
.
gg® ©#
ScopesValuesConsented
gg© æ
,
ggæ ø
grantedConsent
gg¿ Œ
.
ggŒ œ
RememberConsent
ggœ ﬁ
)
ggﬁ ﬂ
)
ggﬂ ‡
;
gg‡ ·
	Telemetryhh 
.hh 
Metricshh !
.hh! "
ConsentGrantedhh" 0
(hh0 1
requesthh1 8
.hh8 9
Clienthh9 ?
.hh? @
ClientIdhh@ H
,hhH I
grantedConsenthhJ X
.hhX Y!
ScopesValuesConsentedhhY n
,hhn o
grantedConsenthhp ~
.hh~ 
RememberConsent	hh é
)
hhé è
;
hhè ê
varii 
deniedii 
=ii 
requestii $
.ii$ %
ValidatedResourcesii% 7
.ii7 8
ParsedScopesii8 D
.iiD E
SelectiiE K
(iiK L
siiL M
=>iiN P
siiQ R
.iiR S

ParsedNameiiS ]
)ii] ^
.ii^ _
Exceptii_ e
(iie f
grantedConsentiif t
.iit u"
ScopesValuesConsented	iiu ä
)
iiä ã
;
iiã å
	Telemetryjj 
.jj 
Metricsjj !
.jj! "
ConsentDeniedjj" /
(jj/ 0
requestjj0 7
.jj7 8
Clientjj8 >
.jj> ?
ClientIdjj? G
,jjG H
deniedjjI O
)jjO P
;jjP Q
}kk 
elsell 
{mm 

ModelStatenn 
.nn 
AddModelErrornn (
(nn( )
$strnn) +
,nn+ ,
ConsentOptionsnn- ;
.nn; <%
MustChooseOneErrorMessagenn< U
)nnU V
;nnV W
}oo 
}pp 	
elseqq 
{rr 	

ModelStatess 
.ss 
AddModelErrorss $
(ss$ %
$strss% '
,ss' (
ConsentOptionsss) 7
.ss7 8(
InvalidSelectionErrorMessagess8 T
)ssT U
;ssU V
}tt 	
ifvv 

(vv 
grantedConsentvv 
!=vv 
nullvv "
)vv" #
{ww 	
awaityy 
_interactionyy 
.yy 
HandleRequestAsyncyy 1
(yy1 2
Inputyy2 7
.yy7 8
UserCodeyy8 @
,yy@ A
grantedConsentyyB P
)yyP Q
;yyQ R
return|| 
RedirectToPage|| !
(||! "
$str||" 3
)||3 4
;||4 5
}}} 	
if
ÄÄ 

(
ÄÄ 
!
ÄÄ 
await
ÄÄ 
SetViewModelAsync
ÄÄ $
(
ÄÄ$ %
Input
ÄÄ% *
.
ÄÄ* +
UserCode
ÄÄ+ 3
)
ÄÄ3 4
)
ÄÄ4 5
{
ÅÅ 	
return
ÇÇ 
RedirectToPage
ÇÇ !
(
ÇÇ! "
$str
ÇÇ" 5
)
ÇÇ5 6
;
ÇÇ6 7
}
ÉÉ 	
return
ÑÑ 
Page
ÑÑ 
(
ÑÑ 
)
ÑÑ 
;
ÑÑ 
}
ÖÖ 
private
àà 
async
àà 
Task
àà 
<
àà 
bool
àà 
>
àà 
SetViewModelAsync
àà .
(
àà. /
string
àà/ 5
userCode
àà6 >
)
àà> ?
{
ââ 
var
ää 
request
ää 
=
ää 
await
ää 
_interaction
ää (
.
ää( )*
GetAuthorizationContextAsync
ää) E
(
ääE F
userCode
ääF N
)
ääN O
;
ääO P
if
ãã 

(
ãã 
request
ãã 
!=
ãã 
null
ãã 
)
ãã 
{
åå 	
View
çç 
=
çç $
CreateConsentViewModel
çç )
(
çç) *
request
çç* 1
)
çç1 2
;
çç2 3
return
éé 
true
éé 
;
éé 
}
èè 	
else
êê 
{
ëë 	
View
íí 
=
íí 
new
íí 
	ViewModel
íí  
(
íí  !
)
íí! "
;
íí" #
return
ìì 
false
ìì 
;
ìì 
}
îî 	
}
ïï 
private
óó 
	ViewModel
óó $
CreateConsentViewModel
óó ,
(
óó, -,
DeviceFlowAuthorizationRequest
óó- K
request
óóL S
)
óóS T
{
òò 
var
ôô 
vm
ôô 
=
ôô 
new
ôô 
	ViewModel
ôô 
{
öö 	

ClientName
õõ 
=
õõ 
request
õõ  
.
õõ  !
Client
õõ! '
.
õõ' (

ClientName
õõ( 2
??
õõ3 5
request
õõ6 =
.
õõ= >
Client
õõ> D
.
õõD E
ClientId
õõE M
,
õõM N
	ClientUrl
úú 
=
úú 
request
úú 
.
úú  
Client
úú  &
.
úú& '
	ClientUri
úú' 0
,
úú0 1
ClientLogoUrl
ùù 
=
ùù 
request
ùù #
.
ùù# $
Client
ùù$ *
.
ùù* +
LogoUri
ùù+ 2
,
ùù2 3"
AllowRememberConsent
ûû  
=
ûû! "
request
ûû# *
.
ûû* +
Client
ûû+ 1
.
ûû1 2"
AllowRememberConsent
ûû2 F
}
üü 	
;
üü	 

vm
°° 

.
°°
 
IdentityScopes
°° 
=
°° 
request
°° #
.
°°# $ 
ValidatedResources
°°$ 6
.
°°6 7
	Resources
°°7 @
.
°°@ A
IdentityResources
°°A R
.
°°R S
Select
°°S Y
(
°°Y Z
x
°°Z [
=>
°°\ ^"
CreateScopeViewModel
°°_ s
(
°°s t
x
°°t u
,
°°u v
Input
°°w |
==
°°} 
null°°Ä Ñ
||°°Ö á
Input°°à ç
.°°ç é
ScopesConsented°°é ù
.°°ù û
Contains°°û ¶
(°°¶ ß
x°°ß ®
.°°® ©
Name°°© ≠
)°°≠ Æ
)°°Æ Ø
)°°Ø ∞
.°°∞ ±
ToArray°°± ∏
(°°∏ π
)°°π ∫
;°°∫ ª
var
££ 
	apiScopes
££ 
=
££ 
new
££ 
List
££  
<
££  !
ScopeViewModel
££! /
>
££/ 0
(
££0 1
)
££1 2
;
££2 3
foreach
§§ 
(
§§ 
var
§§ 
parsedScope
§§  
in
§§! #
request
§§$ +
.
§§+ , 
ValidatedResources
§§, >
.
§§> ?
ParsedScopes
§§? K
)
§§K L
{
•• 	
var
¶¶ 
apiScope
¶¶ 
=
¶¶ 
request
¶¶ "
.
¶¶" # 
ValidatedResources
¶¶# 5
.
¶¶5 6
	Resources
¶¶6 ?
.
¶¶? @
FindApiScope
¶¶@ L
(
¶¶L M
parsedScope
¶¶M X
.
¶¶X Y

ParsedName
¶¶Y c
)
¶¶c d
;
¶¶d e
if
ßß 
(
ßß 
apiScope
ßß 
!=
ßß 
null
ßß  
)
ßß  !
{
®® 
var
©© 
scopeVm
©© 
=
©© "
CreateScopeViewModel
©© 2
(
©©2 3
parsedScope
©©3 >
,
©©> ?
apiScope
©©@ H
,
©©H I
Input
©©J O
==
©©P R
null
©©S W
||
©©X Z
Input
©©[ `
.
©©` a
ScopesConsented
©©a p
.
©©p q
Contains
©©q y
(
©©y z
parsedScope©©z Ö
.©©Ö Ü
RawValue©©Ü é
)©©é è
)©©è ê
;©©ê ë
	apiScopes
™™ 
.
™™ 
Add
™™ 
(
™™ 
scopeVm
™™ %
)
™™% &
;
™™& '
}
´´ 
}
¨¨ 	
if
≠≠ 

(
≠≠ 
DeviceOptions
≠≠ 
.
≠≠ !
EnableOfflineAccess
≠≠ -
&&
≠≠. 0
request
≠≠1 8
.
≠≠8 9 
ValidatedResources
≠≠9 K
.
≠≠K L
	Resources
≠≠L U
.
≠≠U V
OfflineAccess
≠≠V c
)
≠≠c d
{
ÆÆ 	
	apiScopes
ØØ 
.
ØØ 
Add
ØØ 
(
ØØ #
GetOfflineAccessScope
ØØ /
(
ØØ/ 0
Input
ØØ0 5
==
ØØ6 8
null
ØØ9 =
||
ØØ> @
Input
ØØA F
.
ØØF G
ScopesConsented
ØØG V
.
ØØV W
Contains
ØØW _
(
ØØ_ `
Duende
ØØ` f
.
ØØf g
IdentityServer
ØØg u
.
ØØu v&
IdentityServerConstantsØØv ç
.ØØç é
StandardScopesØØé ú
.ØØú ù
OfflineAccessØØù ™
)ØØ™ ´
)ØØ´ ¨
)ØØ¨ ≠
;ØØ≠ Æ
}
∞∞ 	
vm
±± 

.
±±
 
	ApiScopes
±± 
=
±± 
	apiScopes
±±  
;
±±  !
return
≥≥ 
vm
≥≥ 
;
≥≥ 
}
¥¥ 
private
∂∂ 
static
∂∂ 
ScopeViewModel
∂∂ !"
CreateScopeViewModel
∂∂" 6
(
∂∂6 7
IdentityResource
∂∂7 G
identity
∂∂H P
,
∂∂P Q
bool
∂∂R V
check
∂∂W \
)
∂∂\ ]
{
∑∑ 
return
∏∏ 
new
∏∏ 
ScopeViewModel
∏∏ !
{
ππ 	
Value
∫∫ 
=
∫∫ 
identity
∫∫ 
.
∫∫ 
Name
∫∫ !
,
∫∫! "
DisplayName
ªª 
=
ªª 
identity
ªª "
.
ªª" #
DisplayName
ªª# .
??
ªª/ 1
identity
ªª2 :
.
ªª: ;
Name
ªª; ?
,
ªª? @
Description
ºº 
=
ºº 
identity
ºº "
.
ºº" #
Description
ºº# .
,
ºº. /
	Emphasize
ΩΩ 
=
ΩΩ 
identity
ΩΩ  
.
ΩΩ  !
	Emphasize
ΩΩ! *
,
ΩΩ* +
Required
ææ 
=
ææ 
identity
ææ 
.
ææ  
Required
ææ  (
,
ææ( )
Checked
øø 
=
øø 
check
øø 
||
øø 
identity
øø '
.
øø' (
Required
øø( 0
}
¿¿ 	
;
¿¿	 

}
¡¡ 
private
√√ 
static
√√ 
ScopeViewModel
√√ !"
CreateScopeViewModel
√√" 6
(
√√6 7
ParsedScopeValue
√√7 G
parsedScopeValue
√√H X
,
√√X Y
ApiScope
√√Z b
apiScope
√√c k
,
√√k l
bool
√√m q
check
√√r w
)
√√w x
{
ƒƒ 
return
≈≈ 
new
≈≈ 
ScopeViewModel
≈≈ !
{
∆∆ 	
Value
«« 
=
«« 
parsedScopeValue
«« $
.
««$ %
RawValue
««% -
,
««- .
DisplayName
…… 
=
…… 
apiScope
…… "
.
……" #
DisplayName
……# .
??
……/ 1
apiScope
……2 :
.
……: ;
Name
……; ?
,
……? @
Description
   
=
   
apiScope
   "
.
  " #
Description
  # .
,
  . /
	Emphasize
ÀÀ 
=
ÀÀ 
apiScope
ÀÀ  
.
ÀÀ  !
	Emphasize
ÀÀ! *
,
ÀÀ* +
Required
ÃÃ 
=
ÃÃ 
apiScope
ÃÃ 
.
ÃÃ  
Required
ÃÃ  (
,
ÃÃ( )
Checked
ÕÕ 
=
ÕÕ 
check
ÕÕ 
||
ÕÕ 
apiScope
ÕÕ '
.
ÕÕ' (
Required
ÕÕ( 0
}
ŒŒ 	
;
ŒŒ	 

}
œœ 
private
—— 
static
—— 
ScopeViewModel
—— !#
GetOfflineAccessScope
——" 7
(
——7 8
bool
——8 <
check
——= B
)
——B C
{
““ 
return
”” 
new
”” 
ScopeViewModel
”” !
{
‘‘ 	
Value
’’ 
=
’’ 
Duende
’’ 
.
’’ 
IdentityServer
’’ )
.
’’) *%
IdentityServerConstants
’’* A
.
’’A B
StandardScopes
’’B P
.
’’P Q
OfflineAccess
’’Q ^
,
’’^ _
DisplayName
÷÷ 
=
÷÷ 
DeviceOptions
÷÷ '
.
÷÷' (&
OfflineAccessDisplayName
÷÷( @
,
÷÷@ A
Description
◊◊ 
=
◊◊ 
DeviceOptions
◊◊ '
.
◊◊' (&
OfflineAccessDescription
◊◊( @
,
◊◊@ A
	Emphasize
ÿÿ 
=
ÿÿ 
true
ÿÿ 
,
ÿÿ 
Checked
ŸŸ 
=
ŸŸ 
check
ŸŸ 
}
⁄⁄ 	
;
⁄⁄	 

}
€€ 
}‹‹ ‰

iC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Device\DeviceOptions.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Device! '
;' (
public 
static 
class 
DeviceOptions !
{ 
public 

static 
readonly 
bool 
EnableOfflineAccess  3
=4 5
true6 :
;: ;
public		 

static		 
readonly		 
string		 !$
OfflineAccessDisplayName		" :
=		; <
$str		= M
;		M N
public

 

static

 
readonly

 
string

 !$
OfflineAccessDescription

" :
=

; <
$str	

= É
;


É Ñ
public 

static 
readonly 
string !
InvalidUserCode" 1
=2 3
$str4 G
;G H
public 

static 
readonly 
string !%
MustChooseOneErrorMessage" ;
=< =
$str> e
;e f
public 

static 
readonly 
string !(
InvalidSelectionErrorMessage" >
=? @
$strA T
;T U
} «
fC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Consent\ViewModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Consent! (
;( )
public 
class 
	ViewModel 
{ 
public 

string 
? 

ClientName 
{ 
get  #
;# $
set% (
;( )
}* +
public		 

string		 
?		 
	ClientUrl		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 

string

 
?

 
ClientLogoUrl

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 

bool  
AllowRememberConsent $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 

IEnumerable 
< 
ScopeViewModel %
>% &
IdentityScopes' 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
=D E

EnumerableF P
.P Q
EmptyQ V
<V W
ScopeViewModelW e
>e f
(f g
)g h
;h i
public 

IEnumerable 
< 
ScopeViewModel %
>% &
	ApiScopes' 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
=? @

EnumerableA K
.K L
EmptyL Q
<Q R
ScopeViewModelR `
>` a
(a b
)b c
;c d
} 
public 
class 
ScopeViewModel 
{ 
public 

string 
? 
Name 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
? 
Value 
{ 
get 
; 
set  #
;# $
}% &
public 

string 
? 
DisplayName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

bool 
	Emphasize 
{ 
get 
;  
set! $
;$ %
}& '
public 

bool 
Required 
{ 
get 
; 
set  #
;# $
}% &
public 

bool 
Checked 
{ 
get 
; 
set "
;" #
}$ %
public 

IEnumerable 
< 
ResourceViewModel (
>( )
	Resources* 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
=B C

EnumerableD N
.N O
EmptyO T
<T U
ResourceViewModelU f
>f g
(g h
)h i
;i j
} 
public 
class 
ResourceViewModel 
{ 
public 

string 
? 
Name 
{ 
get 
; 
set "
;" #
}$ %
public   

string   
?   
DisplayName   
{    
get  ! $
;  $ %
set  & )
;  ) *
}  + ,
}!! £
gC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Consent\InputModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Consent! (
;( )
public 
class 

InputModel 
{ 
public 

string 
? 
Button 
{ 
get 
;  
set! $
;$ %
}& '
public		 

IEnumerable		 
<		 
string		 
>		 
ScopesConsented		 .
{		/ 0
get		1 4
;		4 5
set		6 9
;		9 :
}		; <
=		= >
new		? B
List		C G
<		G H
string		H N
>		N O
(		O P
)		P Q
;		Q R
public

 

bool

 
RememberConsent

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
=

. /
true

0 4
;

4 5
public 

string 
? 
	ReturnUrl 
{ 
get "
;" #
set$ '
;' (
}) *
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
} ã∂
iC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Consent\Index.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Consent! (
;( )
[ 
	Authorize 

]
 
[ 
SecurityHeaders 
] 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IEventService "
_events# *
;* +
private 
readonly 
ILogger 
< 
Index "
>" #
_logger$ +
;+ ,
public 

Index 
( -
!IIdentityServerInteractionService )
interaction* 5
,5 6
IEventService 
events 
, 
ILogger 
< 
Index 
> 
logger 
) 
{ 
_interaction 
= 
interaction "
;" #
_events 
= 
events 
; 
_logger 
= 
logger 
; 
}   
public"" 

	ViewModel"" 
View"" 
{"" 
get"" 
;""  
set""! $
;""$ %
}""& '
=""( )
default""* 1
!""1 2
;""2 3
[$$ 
BindProperty$$ 
]$$ 
public%% 


InputModel%% 
Input%% 
{%% 
get%% !
;%%! "
set%%# &
;%%& '
}%%( )
=%%* +
default%%, 3
!%%3 4
;%%4 5
public'' 

async'' 
Task'' 
<'' 
IActionResult'' #
>''# $
OnGet''% *
(''* +
string''+ 1
?''1 2
	returnUrl''3 <
)''< =
{(( 
if)) 

()) 
!)) 
await)) 
SetViewModelAsync)) $
())$ %
	returnUrl))% .
))). /
)))/ 0
{** 	
return++ 
RedirectToPage++ !
(++! "
$str++" 5
)++5 6
;++6 7
},, 	
Input.. 
=.. 
new.. 

InputModel.. 
{// 	
	ReturnUrl00 
=00 
	returnUrl00 !
,00! "
}11 	
;11	 

return33 
Page33 
(33 
)33 
;33 
}44 
public66 

async66 
Task66 
<66 
IActionResult66 #
>66# $
OnPost66% +
(66+ ,
)66, -
{77 
var99 
request99 
=99 
await99 
_interaction99 (
.99( )(
GetAuthorizationContextAsync99) E
(99E F
Input99F K
.99K L
	ReturnUrl99L U
)99U V
;99V W
if:: 

(:: 
request:: 
==:: 
null:: 
):: 
return:: #
RedirectToPage::$ 2
(::2 3
$str::3 F
)::F G
;::G H
ConsentResponse<< 
?<< 
grantedConsent<< '
=<<( )
null<<* .
;<<. /
if?? 

(?? 
Input?? 
.?? 
Button?? 
==?? 
$str??  
)??  !
{@@ 	
grantedConsentAA 
=AA 
newAA  
ConsentResponseAA! 0
{AA1 2
ErrorAA3 8
=AA9 :
AuthorizationErrorAA; M
.AAM N
AccessDeniedAAN Z
}AA[ \
;AA\ ]
awaitDD 
_eventsDD 
.DD 

RaiseAsyncDD $
(DD$ %
newDD% (
ConsentDeniedEventDD) ;
(DD; <
UserDD< @
.DD@ A
GetSubjectIdDDA M
(DDM N
)DDN O
,DDO P
requestDDQ X
.DDX Y
ClientDDY _
.DD_ `
ClientIdDD` h
,DDh i
requestDDj q
.DDq r
ValidatedResources	DDr Ñ
.
DDÑ Ö
RawScopeValues
DDÖ ì
)
DDì î
)
DDî ï
;
DDï ñ
	TelemetryEE 
.EE 
MetricsEE 
.EE 
ConsentDeniedEE +
(EE+ ,
requestEE, 3
.EE3 4
ClientEE4 :
.EE: ;
ClientIdEE; C
,EEC D
requestEEE L
.EEL M
ValidatedResourcesEEM _
.EE_ `
ParsedScopesEE` l
.EEl m
SelectEEm s
(EEs t
sEEt u
=>EEv x
sEEy z
.EEz {

ParsedName	EE{ Ö
)
EEÖ Ü
)
EEÜ á
;
EEá à
}FF 	
elseHH 
ifHH 
(HH 
InputHH 
.HH 
ButtonHH 
==HH  
$strHH! &
)HH& '
{II 	
ifKK 
(KK 
InputKK 
.KK 
ScopesConsentedKK %
.KK% &
AnyKK& )
(KK) *
)KK* +
)KK+ ,
{LL 
varMM 
scopesMM 
=MM 
InputMM "
.MM" #
ScopesConsentedMM# 2
;MM2 3
ifNN 
(NN 
ConsentOptionsNN "
.NN" #
EnableOfflineAccessNN# 6
==NN7 9
falseNN: ?
)NN? @
{OO 
scopesPP 
=PP 
scopesPP #
.PP# $
WherePP$ )
(PP) *
xPP* +
=>PP, .
xPP/ 0
!=PP1 3
DuendePP4 :
.PP: ;
IdentityServerPP; I
.PPI J#
IdentityServerConstantsPPJ a
.PPa b
StandardScopesPPb p
.PPp q
OfflineAccessPPq ~
)PP~ 
;	PP Ä
}QQ 
grantedConsentSS 
=SS  
newSS! $
ConsentResponseSS% 4
{TT 
RememberConsentUU #
=UU$ %
InputUU& +
.UU+ ,
RememberConsentUU, ;
,UU; <!
ScopesValuesConsentedVV )
=VV* +
scopesVV, 2
.VV2 3
ToArrayVV3 :
(VV: ;
)VV; <
,VV< =
DescriptionWW 
=WW  !
InputWW" '
.WW' (
DescriptionWW( 3
}XX 
;XX 
await[[ 
_events[[ 
.[[ 

RaiseAsync[[ (
([[( )
new[[) ,
ConsentGrantedEvent[[- @
([[@ A
User[[A E
.[[E F
GetSubjectId[[F R
([[R S
)[[S T
,[[T U
request[[V ]
.[[] ^
Client[[^ d
.[[d e
ClientId[[e m
,[[m n
request[[o v
.[[v w
ValidatedResources	[[w â
.
[[â ä
RawScopeValues
[[ä ò
,
[[ò ô
grantedConsent
[[ö ®
.
[[® ©#
ScopesValuesConsented
[[© æ
,
[[æ ø
grantedConsent
[[¿ Œ
.
[[Œ œ
RememberConsent
[[œ ﬁ
)
[[ﬁ ﬂ
)
[[ﬂ ‡
;
[[‡ ·
	Telemetry\\ 
.\\ 
Metrics\\ !
.\\! "
ConsentGranted\\" 0
(\\0 1
request\\1 8
.\\8 9
Client\\9 ?
.\\? @
ClientId\\@ H
,\\H I
grantedConsent\\J X
.\\X Y!
ScopesValuesConsented\\Y n
,\\n o
grantedConsent\\p ~
.\\~ 
RememberConsent	\\ é
)
\\é è
;
\\è ê
var]] 
denied]] 
=]] 
request]] $
.]]$ %
ValidatedResources]]% 7
.]]7 8
ParsedScopes]]8 D
.]]D E
Select]]E K
(]]K L
s]]L M
=>]]N P
s]]Q R
.]]R S

ParsedName]]S ]
)]]] ^
.]]^ _
Except]]_ e
(]]e f
grantedConsent]]f t
.]]t u"
ScopesValuesConsented	]]u ä
)
]]ä ã
;
]]ã å
	Telemetry^^ 
.^^ 
Metrics^^ !
.^^! "
ConsentDenied^^" /
(^^/ 0
request^^0 7
.^^7 8
Client^^8 >
.^^> ?
ClientId^^? G
,^^G H
denied^^I O
)^^O P
;^^P Q
}__ 
else`` 
{aa 

ModelStatebb 
.bb 
AddModelErrorbb (
(bb( )
$strbb) +
,bb+ ,
ConsentOptionsbb- ;
.bb; <%
MustChooseOneErrorMessagebb< U
)bbU V
;bbV W
}cc 
}dd 	
elseee 
{ff 	

ModelStategg 
.gg 
AddModelErrorgg $
(gg$ %
$strgg% '
,gg' (
ConsentOptionsgg) 7
.gg7 8(
InvalidSelectionErrorMessagegg8 T
)ggT U
;ggU V
}hh 	
ifjj 

(jj 
grantedConsentjj 
!=jj 
nulljj "
)jj" #
{kk 	!
ArgumentNullExceptionll !
.ll! "
ThrowIfNullll" -
(ll- .
Inputll. 3
.ll3 4
	ReturnUrlll4 =
,ll= >
nameofll? E
(llE F
InputllF K
.llK L
	ReturnUrlllL U
)llU V
)llV W
;llW X
awaitoo 
_interactionoo 
.oo 
GrantConsentAsyncoo 0
(oo0 1
requestoo1 8
,oo8 9
grantedConsentoo: H
)ooH I
;ooI J
ifrr 
(rr 
requestrr 
.rr 
IsNativeClientrr &
(rr& '
)rr' (
==rr) +
truerr, 0
)rr0 1
{ss 
returnvv 
thisvv 
.vv 
LoadingPagevv '
(vv' (
Inputvv( -
.vv- .
	ReturnUrlvv. 7
)vv7 8
;vv8 9
}ww 
returnyy 
Redirectyy 
(yy 
Inputyy !
.yy! "
	ReturnUrlyy" +
)yy+ ,
;yy, -
}zz 	
if}} 

(}} 
!}} 
await}} 
SetViewModelAsync}} $
(}}$ %
Input}}% *
.}}* +
	ReturnUrl}}+ 4
)}}4 5
)}}5 6
{~~ 	
return 
RedirectToPage !
(! "
$str" 5
)5 6
;6 7
}
ÄÄ 	
return
ÅÅ 
Page
ÅÅ 
(
ÅÅ 
)
ÅÅ 
;
ÅÅ 
}
ÇÇ 
private
ÑÑ 
async
ÑÑ 
Task
ÑÑ 
<
ÑÑ 
bool
ÑÑ 
>
ÑÑ 
SetViewModelAsync
ÑÑ .
(
ÑÑ. /
string
ÑÑ/ 5
?
ÑÑ5 6
	returnUrl
ÑÑ7 @
)
ÑÑ@ A
{
ÖÖ #
ArgumentNullException
ÜÜ 
.
ÜÜ 
ThrowIfNull
ÜÜ )
(
ÜÜ) *
	returnUrl
ÜÜ* 3
)
ÜÜ3 4
;
ÜÜ4 5
var
àà 
request
àà 
=
àà 
await
àà 
_interaction
àà (
.
àà( )*
GetAuthorizationContextAsync
àà) E
(
ààE F
	returnUrl
ààF O
)
ààO P
;
ààP Q
if
ââ 

(
ââ 
request
ââ 
!=
ââ 
null
ââ 
)
ââ 
{
ää 	
View
ãã 
=
ãã $
CreateConsentViewModel
ãã )
(
ãã) *
request
ãã* 1
)
ãã1 2
;
ãã2 3
return
åå 
true
åå 
;
åå 
}
çç 	
else
éé 
{
èè 	
_logger
êê 
.
êê &
NoConsentMatchingRequest
êê ,
(
êê, -
	returnUrl
êê- 6
)
êê6 7
;
êê7 8
return
ëë 
false
ëë 
;
ëë 
}
íí 	
}
ìì 
private
ïï 
	ViewModel
ïï $
CreateConsentViewModel
ïï ,
(
ïï, -"
AuthorizationRequest
ïï- A
request
ïïB I
)
ïïI J
{
ññ 
var
óó 
vm
óó 
=
óó 
new
óó 
	ViewModel
óó 
{
òò 	

ClientName
ôô 
=
ôô 
request
ôô  
.
ôô  !
Client
ôô! '
.
ôô' (

ClientName
ôô( 2
??
ôô3 5
request
ôô6 =
.
ôô= >
Client
ôô> D
.
ôôD E
ClientId
ôôE M
,
ôôM N
	ClientUrl
öö 
=
öö 
request
öö 
.
öö  
Client
öö  &
.
öö& '
	ClientUri
öö' 0
,
öö0 1
ClientLogoUrl
õõ 
=
õõ 
request
õõ #
.
õõ# $
Client
õõ$ *
.
õõ* +
LogoUri
õõ+ 2
,
õõ2 3"
AllowRememberConsent
úú  
=
úú! "
request
úú# *
.
úú* +
Client
úú+ 1
.
úú1 2"
AllowRememberConsent
úú2 F
}
ùù 	
;
ùù	 

vm
üü 

.
üü
 
IdentityScopes
üü 
=
üü 
request
üü #
.
üü# $ 
ValidatedResources
üü$ 6
.
üü6 7
	Resources
üü7 @
.
üü@ A
IdentityResources
üüA R
.
†† 
Select
†† 
(
†† 
x
†† 
=>
†† "
CreateScopeViewModel
†† -
(
††- .
x
††. /
,
††/ 0
Input
††1 6
==
††7 9
null
††: >
||
††? A
Input
††B G
.
††G H
ScopesConsented
††H W
.
††W X
Contains
††X `
(
††` a
x
††a b
.
††b c
Name
††c g
)
††g h
)
††h i
)
††i j
.
°° 
ToArray
°° 
(
°° 
)
°° 
;
°° 
var
££  
resourceIndicators
££ 
=
££  
request
££! (
.
££( )

Parameters
££) 3
.
££3 4
	GetValues
££4 =
(
££= >
OidcConstants
££> K
.
££K L
AuthorizeRequest
££L \
.
££\ ]
Resource
££] e
)
££e f
??
££g i

Enumerable
££j t
.
££t u
Empty
££u z
<
££z {
string££{ Å
>££Å Ç
(££Ç É
)££É Ñ
;££Ñ Ö
var
§§ 
apiResources
§§ 
=
§§ 
request
§§ "
.
§§" # 
ValidatedResources
§§# 5
.
§§5 6
	Resources
§§6 ?
.
§§? @
ApiResources
§§@ L
.
§§L M
Where
§§M R
(
§§R S
x
§§S T
=>
§§U W 
resourceIndicators
§§X j
.
§§j k
Contains
§§k s
(
§§s t
x
§§t u
.
§§u v
Name
§§v z
)
§§z {
)
§§{ |
;
§§| }
var
¶¶ 
	apiScopes
¶¶ 
=
¶¶ 
new
¶¶ 
List
¶¶  
<
¶¶  !
ScopeViewModel
¶¶! /
>
¶¶/ 0
(
¶¶0 1
)
¶¶1 2
;
¶¶2 3
foreach
ßß 
(
ßß 
var
ßß 
parsedScope
ßß  
in
ßß! #
request
ßß$ +
.
ßß+ , 
ValidatedResources
ßß, >
.
ßß> ?
ParsedScopes
ßß? K
)
ßßK L
{
®® 	
var
©© 
apiScope
©© 
=
©© 
request
©© "
.
©©" # 
ValidatedResources
©©# 5
.
©©5 6
	Resources
©©6 ?
.
©©? @
FindApiScope
©©@ L
(
©©L M
parsedScope
©©M X
.
©©X Y

ParsedName
©©Y c
)
©©c d
;
©©d e
if
™™ 
(
™™ 
apiScope
™™ 
!=
™™ 
null
™™  
)
™™  !
{
´´ 
var
¨¨ 
scopeVm
¨¨ 
=
¨¨ "
CreateScopeViewModel
¨¨ 2
(
¨¨2 3
parsedScope
¨¨3 >
,
¨¨> ?
apiScope
¨¨@ H
,
¨¨H I
Input
¨¨J O
==
¨¨P R
null
¨¨S W
||
¨¨X Z
Input
¨¨[ `
.
¨¨` a
ScopesConsented
¨¨a p
.
¨¨p q
Contains
¨¨q y
(
¨¨y z
parsedScope¨¨z Ö
.¨¨Ö Ü
RawValue¨¨Ü é
)¨¨é è
)¨¨è ê
;¨¨ê ë
scopeVm
≠≠ 
.
≠≠ 
	Resources
≠≠ !
=
≠≠" #
apiResources
≠≠$ 0
.
≠≠0 1
Where
≠≠1 6
(
≠≠6 7
x
≠≠7 8
=>
≠≠9 ;
x
≠≠< =
.
≠≠= >
Scopes
≠≠> D
.
≠≠D E
Contains
≠≠E M
(
≠≠M N
parsedScope
≠≠N Y
.
≠≠Y Z

ParsedName
≠≠Z d
)
≠≠d e
)
≠≠e f
.
ÆÆ 
Select
ÆÆ 
(
ÆÆ 
x
ÆÆ 
=>
ÆÆ  
new
ÆÆ! $
ResourceViewModel
ÆÆ% 6
{
ØØ 
Name
∞∞ 
=
∞∞ 
x
∞∞  
.
∞∞  !
Name
∞∞! %
,
∞∞% &
DisplayName
±± #
=
±±$ %
x
±±& '
.
±±' (
DisplayName
±±( 3
??
±±4 6
x
±±7 8
.
±±8 9
Name
±±9 =
,
±±= >
}
≤≤ 
)
≤≤ 
.
≤≤ 
ToArray
≤≤ 
(
≤≤ 
)
≤≤  
;
≤≤  !
	apiScopes
≥≥ 
.
≥≥ 
Add
≥≥ 
(
≥≥ 
scopeVm
≥≥ %
)
≥≥% &
;
≥≥& '
}
¥¥ 
}
µµ 	
if
∂∂ 

(
∂∂ 
ConsentOptions
∂∂ 
.
∂∂ !
EnableOfflineAccess
∂∂ .
&&
∂∂/ 1
request
∂∂2 9
.
∂∂9 : 
ValidatedResources
∂∂: L
.
∂∂L M
	Resources
∂∂M V
.
∂∂V W
OfflineAccess
∂∂W d
)
∂∂d e
{
∑∑ 	
	apiScopes
∏∏ 
.
∏∏ 
Add
∏∏ 
(
∏∏ &
CreateOfflineAccessScope
∏∏ 2
(
∏∏2 3
Input
∏∏3 8
==
∏∏9 ;
null
∏∏< @
||
∏∏A C
Input
∏∏D I
.
∏∏I J
ScopesConsented
∏∏J Y
.
∏∏Y Z
Contains
∏∏Z b
(
∏∏b c
Duende
∏∏c i
.
∏∏i j
IdentityServer
∏∏j x
.
∏∏x y&
IdentityServerConstants∏∏y ê
.∏∏ê ë
StandardScopes∏∏ë ü
.∏∏ü †
OfflineAccess∏∏† ≠
)∏∏≠ Æ
)∏∏Æ Ø
)∏∏Ø ∞
;∏∏∞ ±
}
ππ 	
vm
∫∫ 

.
∫∫
 
	ApiScopes
∫∫ 
=
∫∫ 
	apiScopes
∫∫  
;
∫∫  !
return
ºº 
vm
ºº 
;
ºº 
}
ΩΩ 
private
øø 
static
øø 
ScopeViewModel
øø !"
CreateScopeViewModel
øø" 6
(
øø6 7
IdentityResource
øø7 G
identity
øøH P
,
øøP Q
bool
øøR V
check
øøW \
)
øø\ ]
{
¿¿ 
return
¡¡ 
new
¡¡ 
ScopeViewModel
¡¡ !
{
¬¬ 	
Name
√√ 
=
√√ 
identity
√√ 
.
√√ 
Name
√√  
,
√√  !
Value
ƒƒ 
=
ƒƒ 
identity
ƒƒ 
.
ƒƒ 
Name
ƒƒ !
,
ƒƒ! "
DisplayName
≈≈ 
=
≈≈ 
identity
≈≈ "
.
≈≈" #
DisplayName
≈≈# .
??
≈≈/ 1
identity
≈≈2 :
.
≈≈: ;
Name
≈≈; ?
,
≈≈? @
Description
∆∆ 
=
∆∆ 
identity
∆∆ "
.
∆∆" #
Description
∆∆# .
,
∆∆. /
	Emphasize
«« 
=
«« 
identity
««  
.
««  !
	Emphasize
««! *
,
««* +
Required
»» 
=
»» 
identity
»» 
.
»»  
Required
»»  (
,
»»( )
Checked
…… 
=
…… 
check
…… 
||
…… 
identity
…… '
.
……' (
Required
……( 0
}
   	
;
  	 

}
ÀÀ 
private
ÕÕ 
static
ÕÕ 
ScopeViewModel
ÕÕ !"
CreateScopeViewModel
ÕÕ" 6
(
ÕÕ6 7
ParsedScopeValue
ÕÕ7 G
parsedScopeValue
ÕÕH X
,
ÕÕX Y
ApiScope
ÕÕZ b
apiScope
ÕÕc k
,
ÕÕk l
bool
ÕÕm q
check
ÕÕr w
)
ÕÕw x
{
ŒŒ 
var
œœ 
displayName
œœ 
=
œœ 
apiScope
œœ 
.
œœ 
DisplayName
œœ (
??
œœ) +
apiScope
œœ, 4
.
œœ4 5
Name
œœ5 9
;
œœ9 :
if
–– 

(
–– 
!
–– 
String
–– 
.
––  
IsNullOrWhiteSpace
–– &
(
––& '
parsedScopeValue
––' 7
.
––7 8
ParsedParameter
––8 G
)
––G H
)
––H I
{
—— 	
displayName
““ 
+=
““ 
$str
““ 
+
““  
parsedScopeValue
““! 1
.
““1 2
ParsedParameter
““2 A
;
““A B
}
”” 	
return
’’ 
new
’’ 
ScopeViewModel
’’ !
{
÷÷ 	
Name
◊◊ 
=
◊◊ 
parsedScopeValue
◊◊ #
.
◊◊# $

ParsedName
◊◊$ .
,
◊◊. /
Value
ÿÿ 
=
ÿÿ 
parsedScopeValue
ÿÿ $
.
ÿÿ$ %
RawValue
ÿÿ% -
,
ÿÿ- .
DisplayName
ŸŸ 
=
ŸŸ 
displayName
ŸŸ %
,
ŸŸ% &
Description
⁄⁄ 
=
⁄⁄ 
apiScope
⁄⁄ "
.
⁄⁄" #
Description
⁄⁄# .
,
⁄⁄. /
	Emphasize
€€ 
=
€€ 
apiScope
€€  
.
€€  !
	Emphasize
€€! *
,
€€* +
Required
‹‹ 
=
‹‹ 
apiScope
‹‹ 
.
‹‹  
Required
‹‹  (
,
‹‹( )
Checked
›› 
=
›› 
check
›› 
||
›› 
apiScope
›› '
.
››' (
Required
››( 0
}
ﬁﬁ 	
;
ﬁﬁ	 

}
ﬂﬂ 
private
·· 
static
·· 
ScopeViewModel
·· !&
CreateOfflineAccessScope
··" :
(
··: ;
bool
··; ?
check
··@ E
)
··E F
{
‚‚ 
return
„„ 
new
„„ 
ScopeViewModel
„„ !
{
‰‰ 	
Value
ÂÂ 
=
ÂÂ 
Duende
ÂÂ 
.
ÂÂ 
IdentityServer
ÂÂ )
.
ÂÂ) *%
IdentityServerConstants
ÂÂ* A
.
ÂÂA B
StandardScopes
ÂÂB P
.
ÂÂP Q
OfflineAccess
ÂÂQ ^
,
ÂÂ^ _
DisplayName
ÊÊ 
=
ÊÊ 
ConsentOptions
ÊÊ (
.
ÊÊ( )&
OfflineAccessDisplayName
ÊÊ) A
,
ÊÊA B
Description
ÁÁ 
=
ÁÁ 
ConsentOptions
ÁÁ (
.
ÁÁ( )&
OfflineAccessDescription
ÁÁ) A
,
ÁÁA B
	Emphasize
ËË 
=
ËË 
true
ËË 
,
ËË 
Checked
ÈÈ 
=
ÈÈ 
check
ÈÈ 
}
ÍÍ 	
;
ÍÍ	 

}
ÎÎ 
}ÏÏ …	
kC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Consent\ConsentOptions.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Consent! (
;( )
public 
static 
class 
ConsentOptions "
{ 
public 

static 
readonly 
bool 
EnableOfflineAccess  3
=4 5
true6 :
;: ;
public		 

static		 
readonly		 
string		 !$
OfflineAccessDisplayName		" :
=		; <
$str		= M
;		M N
public

 

static

 
readonly

 
string

 !$
OfflineAccessDescription

" :
=

; <
$str	

= É
;


É Ñ
public 

static 
readonly 
string !%
MustChooseOneErrorMessage" ;
=< =
$str> e
;e f
public 

static 
readonly 
string !(
InvalidSelectionErrorMessage" >
=? @
$strA T
;T U
} Ã
cC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Ciba\ViewModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Ciba! %
;% &
public 
class 
	ViewModel 
{ 
public 

string 
? 

ClientName 
{ 
get  #
;# $
set% (
;( )
}* +
public		 

string		 
?		 
	ClientUrl		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 

string

 
?

 
ClientLogoUrl

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 

string 
? 
BindingMessage !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 

IEnumerable 
< 
ScopeViewModel %
>% &
IdentityScopes' 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
=D E

EnumerableF P
.P Q
EmptyQ V
<V W
ScopeViewModelW e
>e f
(f g
)g h
;h i
public 

IEnumerable 
< 
ScopeViewModel %
>% &
	ApiScopes' 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
=? @

EnumerableA K
.K L
EmptyL Q
<Q R
ScopeViewModelR `
>` a
(a b
)b c
;c d
} 
public 
class 
ScopeViewModel 
{ 
public 

string 
? 
Name 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
? 
Value 
{ 
get 
; 
set  #
;# $
}% &
public 

string 
? 
DisplayName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

bool 
	Emphasize 
{ 
get 
;  
set! $
;$ %
}& '
public 

bool 
Required 
{ 
get 
; 
set  #
;# $
}% &
public 

bool 
Checked 
{ 
get 
; 
set "
;" #
}$ %
public 

IEnumerable 
< 
ResourceViewModel (
>( )
	Resources* 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
=B C

EnumerableD N
.N O
EmptyO T
<T U
ResourceViewModelU f
>f g
(g h
)h i
;i j
} 
public 
class 
ResourceViewModel 
{ 
public   

string   
?   
Name   
{   
get   
;   
set   "
;  " #
}  $ %
public!! 

string!! 
?!! 
DisplayName!! 
{!!  
get!!! $
;!!$ %
set!!& )
;!!) *
}!!+ ,
}"" ≈	
dC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Ciba\InputModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Ciba! %
;% &
public 
class 

InputModel 
{ 
public 

string 
? 
Button 
{ 
get 
;  
set! $
;$ %
}& '
public		 

IEnumerable		 
<		 
string		 
>		 
ScopesConsented		 .
{		/ 0
get		1 4
;		4 5
set		6 9
;		9 :
}		; <
=		= >
new		? B
List		C G
<		G H
string		H N
>		N O
(		O P
)		P Q
;		Q R
public

 

string

 
?

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
} Ò
fC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Ciba\Index.cshtml.cs
	namespace

 	
EdoAuthServer


 
.

 
UI

 
.

 
Pages

  
.

  !
Ciba

! %
;

% &
[ 
AllowAnonymous 
] 
[ 
SecurityHeaders 
] 
public 
class 

IndexModel 
: 
	PageModel #
{ 
public 
'
BackchannelUserLoginRequest &
LoginRequest' 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
=B C
defaultD K
!K L
;L M
private 
readonly 8
,IBackchannelAuthenticationInteractionService A1
%_backchannelAuthenticationInteractionB g
;g h
private 
readonly 
ILogger 
< 

IndexModel '
>' (
_logger) 0
;0 1
public 


IndexModel 
( 8
,IBackchannelAuthenticationInteractionService B7
+backchannelAuthenticationInteractionServiceC n
,n o
ILoggerp w
<w x

IndexModel	x Ç
>
Ç É
logger
Ñ ä
)
ä ã
{ 1
%_backchannelAuthenticationInteraction -
=. /7
+backchannelAuthenticationInteractionService0 [
;[ \
_logger 
= 
logger 
; 
} 
public 

async 
Task 
< 
IActionResult #
># $
OnGet% *
(* +
string+ 1
id2 4
)4 5
{ 
var 
result 
= 
await 1
%_backchannelAuthenticationInteraction @
.@ A,
 GetLoginRequestByInternalIdAsyncA a
(a b
idb d
)d e
;e f
if 

( 
result 
== 
null 
) 
{ 	
_logger   
.   %
InvalidBackchannelLoginId   -
(  - .
id  . 0
)  0 1
;  1 2
return!! 
RedirectToPage!! !
(!!! "
$str!!" 5
)!!5 6
;!!6 7
}"" 	
else## 
{$$ 	
LoginRequest%% 
=%% 
result%% !
;%%! "
}&& 	
return(( 
Page(( 
((( 
)(( 
;(( 
})) 
}** √	
hC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Ciba\ConsentOptions.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Ciba! %
;% &
public 
static 
class 
ConsentOptions "
{ 
public 

static 
readonly 
bool 
EnableOfflineAccess  3
=4 5
true6 :
;: ;
public		 

static		 
readonly		 
string		 !$
OfflineAccessDisplayName		" :
=		; <
$str		= M
;		M N
public

 

static

 
readonly

 
string

 !$
OfflineAccessDescription

" :
=

; <
$str	

= É
;


É Ñ
public 

static 
readonly 
string !%
MustChooseOneErrorMessage" ;
=< =
$str> e
;e f
public 

static 
readonly 
string !(
InvalidSelectionErrorMessage" >
=? @
$strA T
;T U
} ú≥
hC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Ciba\Consent.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Ciba! %
;% &
[ 
	Authorize 

]
 
[ 
SecurityHeaders 
] 
public 
class 
Consent 
: 
	PageModel  
{ 
private 
readonly 8
,IBackchannelAuthenticationInteractionService A
_interactionB N
;N O
private 
readonly 
IEventService "
_events# *
;* +
private 
readonly 
ILogger 
< 
Consent $
>$ %
_logger& -
;- .
public 

Consent 
( 8
,IBackchannelAuthenticationInteractionService 4
interaction5 @
,@ A
IEventService 
events 
, 
ILogger 
< 
Consent 
> 
logger 
)  
{ 
_interaction 
= 
interaction "
;" #
_events 
= 
events 
; 
_logger 
= 
logger 
; 
} 
public!! 

	ViewModel!! 
View!! 
{!! 
get!! 
;!!  
set!!! $
;!!$ %
}!!& '
=!!( )
default!!* 1
!!!1 2
;!!2 3
[## 
BindProperty## 
]## 
public$$ 


InputModel$$ 
Input$$ 
{$$ 
get$$ !
;$$! "
set$$# &
;$$& '
}$$( )
=$$* +
default$$, 3
!$$3 4
;$$4 5
public&& 

async&& 
Task&& 
<&& 
IActionResult&& #
>&&# $
OnGet&&% *
(&&* +
string&&+ 1
?&&1 2
id&&3 5
)&&5 6
{'' 
if(( 

((( 
!(( 
await(( 
SetViewModelAsync(( $
((($ %
id((% '
)((' (
)((( )
{)) 	
return** 
RedirectToPage** !
(**! "
$str**" 5
)**5 6
;**6 7
}++ 	
Input-- 
=-- 
new-- 

InputModel-- 
{.. 	
Id// 
=// 
id// 
}00 	
;00	 

return22 
Page22 
(22 
)22 
;22 
}33 
public55 

async55 
Task55 
<55 
IActionResult55 #
>55# $
OnPost55% +
(55+ ,
)55, -
{66 
var88 
request88 
=88 
await88 
_interaction88 (
.88( ),
 GetLoginRequestByInternalIdAsync88) I
(88I J
Input88J O
.88O P
Id88P R
??88S U
throw88V [
new88\ _!
ArgumentNullException88` u
(88u v
nameof88v |
(88| }
Input	88} Ç
.
88Ç É
Id
88É Ö
)
88Ö Ü
)
88Ü á
)
88á à
;
88à â
if99 

(99 
request99 
==99 
null99 
||99 
request99 &
.99& '
Subject99' .
.99. /
GetSubjectId99/ ;
(99; <
)99< =
!=99> @
User99A E
.99E F
GetSubjectId99F R
(99R S
)99S T
)99T U
{:: 	
_logger;; 
.;; 
	InvalidId;; 
(;; 
Input;; #
.;;# $
Id;;$ &
);;& '
;;;' (
return<< 
RedirectToPage<< !
(<<! "
$str<<" 5
)<<5 6
;<<6 7
}== 	+
CompleteBackchannelLoginRequest?? '
???' (
result??) /
=??0 1
null??2 6
;??6 7
ifBB 

(BB 
InputBB 
.BB 
ButtonBB 
==BB 
$strBB  
)BB  !
{CC 	
resultDD 
=DD 
newDD +
CompleteBackchannelLoginRequestDD 8
(DD8 9
InputDD9 >
.DD> ?
IdDD? A
)DDA B
;DDB C
awaitGG 
_eventsGG 
.GG 

RaiseAsyncGG $
(GG$ %
newGG% (
ConsentDeniedEventGG) ;
(GG; <
UserGG< @
.GG@ A
GetSubjectIdGGA M
(GGM N
)GGN O
,GGO P
requestGGQ X
.GGX Y
ClientGGY _
.GG_ `
ClientIdGG` h
,GGh i
requestGGj q
.GGq r
ValidatedResources	GGr Ñ
.
GGÑ Ö
RawScopeValues
GGÖ ì
)
GGì î
)
GGî ï
;
GGï ñ
	TelemetryHH 
.HH 
MetricsHH 
.HH 
ConsentDeniedHH +
(HH+ ,
requestHH, 3
.HH3 4
ClientHH4 :
.HH: ;
ClientIdHH; C
,HHC D
requestHHE L
.HHL M
ValidatedResourcesHHM _
.HH_ `
ParsedScopesHH` l
.HHl m
SelectHHm s
(HHs t
sHHt u
=>HHv x
sHHy z
.HHz {

ParsedName	HH{ Ö
)
HHÖ Ü
)
HHÜ á
;
HHá à
}II 	
elseKK 
ifKK 
(KK 
InputKK 
.KK 
ButtonKK 
==KK  
$strKK! &
)KK& '
{LL 	
ifNN 
(NN 
InputNN 
.NN 
ScopesConsentedNN %
.NN% &
AnyNN& )
(NN) *
)NN* +
)NN+ ,
{OO 
varPP 
scopesPP 
=PP 
InputPP "
.PP" #
ScopesConsentedPP# 2
;PP2 3
ifQQ 
(QQ 
ConsentOptionsQQ "
.QQ" #
EnableOfflineAccessQQ# 6
==QQ7 9
falseQQ: ?
)QQ? @
{RR 
scopesSS 
=SS 
scopesSS #
.SS# $
WhereSS$ )
(SS) *
xSS* +
=>SS, .
xSS/ 0
!=SS1 3
DuendeSS4 :
.SS: ;
IdentityServerSS; I
.SSI J#
IdentityServerConstantsSSJ a
.SSa b
StandardScopesSSb p
.SSp q
OfflineAccessSSq ~
)SS~ 
;	SS Ä
}TT 
resultVV 
=VV 
newVV +
CompleteBackchannelLoginRequestVV <
(VV< =
InputVV= B
.VVB C
IdVVC E
)VVE F
{WW !
ScopesValuesConsentedXX )
=XX* +
scopesXX, 2
.XX2 3
ToArrayXX3 :
(XX: ;
)XX; <
,XX< =
DescriptionYY 
=YY  !
InputYY" '
.YY' (
DescriptionYY( 3
}ZZ 
;ZZ 
await]] 
_events]] 
.]] 

RaiseAsync]] (
(]]( )
new]]) ,
ConsentGrantedEvent]]- @
(]]@ A
User]]A E
.]]E F
GetSubjectId]]F R
(]]R S
)]]S T
,]]T U
request]]V ]
.]]] ^
Client]]^ d
.]]d e
ClientId]]e m
,]]m n
request]]o v
.]]v w
ValidatedResources	]]w â
.
]]â ä
RawScopeValues
]]ä ò
,
]]ò ô
result
]]ö †
.
]]† °#
ScopesValuesConsented
]]° ∂
,
]]∂ ∑
false
]]∏ Ω
)
]]Ω æ
)
]]æ ø
;
]]ø ¿
	Telemetry^^ 
.^^ 
Metrics^^ !
.^^! "
ConsentGranted^^" 0
(^^0 1
request^^1 8
.^^8 9
Client^^9 ?
.^^? @
ClientId^^@ H
,^^H I
result^^J P
.^^P Q!
ScopesValuesConsented^^Q f
,^^f g
false^^h m
)^^m n
;^^n o
var__ 
denied__ 
=__ 
request__ $
.__$ %
ValidatedResources__% 7
.__7 8
ParsedScopes__8 D
.__D E
Select__E K
(__K L
s__L M
=>__N P
s__Q R
.__R S

ParsedName__S ]
)__] ^
.__^ _
Except___ e
(__e f
result__f l
.__l m"
ScopesValuesConsented	__m Ç
)
__Ç É
;
__É Ñ
	Telemetry`` 
.`` 
Metrics`` !
.``! "
ConsentDenied``" /
(``/ 0
request``0 7
.``7 8
Client``8 >
.``> ?
ClientId``? G
,``G H
denied``I O
)``O P
;``P Q
}aa 
elsebb 
{cc 

ModelStatedd 
.dd 
AddModelErrordd (
(dd( )
$strdd) +
,dd+ ,
ConsentOptionsdd- ;
.dd; <%
MustChooseOneErrorMessagedd< U
)ddU V
;ddV W
}ee 
}ff 	
elsegg 
{hh 	

ModelStateii 
.ii 
AddModelErrorii $
(ii$ %
$strii% '
,ii' (
ConsentOptionsii) 7
.ii7 8(
InvalidSelectionErrorMessageii8 T
)iiT U
;iiU V
}jj 	
ifll 

(ll 
resultll 
!=ll 
nullll 
)ll 
{mm 	
awaitoo 
_interactionoo 
.oo %
CompleteLoginRequestAsyncoo 8
(oo8 9
resultoo9 ?
)oo? @
;oo@ A
returnqq 
RedirectToPageqq !
(qq! "
$strqq" -
)qq- .
;qq. /
}rr 	
ifuu 

(uu 
!uu 
awaituu 
SetViewModelAsyncuu $
(uu$ %
Inputuu% *
.uu* +
Iduu+ -
)uu- .
)uu. /
{vv 	
returnww 
RedirectToPageww !
(ww! "
$strww" 5
)ww5 6
;ww6 7
}xx 	
returnyy 
Pageyy 
(yy 
)yy 
;yy 
}zz 
private|| 
async|| 
Task|| 
<|| 
bool|| 
>|| 
SetViewModelAsync|| .
(||. /
string||/ 5
?||5 6
id||7 9
)||9 :
{}} !
ArgumentNullException~~ 
.~~ 
ThrowIfNull~~ )
(~~) *
id~~* ,
)~~, -
;~~- .
var
ÄÄ 
request
ÄÄ 
=
ÄÄ 
await
ÄÄ 
_interaction
ÄÄ (
.
ÄÄ( ).
 GetLoginRequestByInternalIdAsync
ÄÄ) I
(
ÄÄI J
id
ÄÄJ L
)
ÄÄL M
;
ÄÄM N
if
ÅÅ 

(
ÅÅ 
request
ÅÅ 
!=
ÅÅ 
null
ÅÅ 
&&
ÅÅ 
request
ÅÅ &
.
ÅÅ& '
Subject
ÅÅ' .
.
ÅÅ. /
GetSubjectId
ÅÅ/ ;
(
ÅÅ; <
)
ÅÅ< =
==
ÅÅ> @
User
ÅÅA E
.
ÅÅE F
GetSubjectId
ÅÅF R
(
ÅÅR S
)
ÅÅS T
)
ÅÅT U
{
ÇÇ 	
View
ÉÉ 
=
ÉÉ $
CreateConsentViewModel
ÉÉ )
(
ÉÉ) *
request
ÉÉ* 1
)
ÉÉ1 2
;
ÉÉ2 3
return
ÑÑ 
true
ÑÑ 
;
ÑÑ 
}
ÖÖ 	
else
ÜÜ 
{
áá 	
_logger
àà 
.
àà /
!NoMatchingBackchannelLoginRequest
àà 5
(
àà5 6
id
àà6 8
)
àà8 9
;
àà9 :
return
ââ 
false
ââ 
;
ââ 
}
ää 	
}
ãã 
private
çç 
	ViewModel
çç $
CreateConsentViewModel
çç ,
(
çç, -)
BackchannelUserLoginRequest
çç- H
request
ççI P
)
ççP Q
{
éé 
var
èè 
vm
èè 
=
èè 
new
èè 
	ViewModel
èè 
{
êê 	

ClientName
ëë 
=
ëë 
request
ëë  
.
ëë  !
Client
ëë! '
.
ëë' (

ClientName
ëë( 2
??
ëë3 5
request
ëë6 =
.
ëë= >
Client
ëë> D
.
ëëD E
ClientId
ëëE M
,
ëëM N
	ClientUrl
íí 
=
íí 
request
íí 
.
íí  
Client
íí  &
.
íí& '
	ClientUri
íí' 0
,
íí0 1
ClientLogoUrl
ìì 
=
ìì 
request
ìì #
.
ìì# $
Client
ìì$ *
.
ìì* +
LogoUri
ìì+ 2
,
ìì2 3
BindingMessage
îî 
=
îî 
request
îî $
.
îî$ %
BindingMessage
îî% 3
}
ïï 	
;
ïï	 

vm
óó 

.
óó
 
IdentityScopes
óó 
=
óó 
request
óó #
.
óó# $ 
ValidatedResources
óó$ 6
.
óó6 7
	Resources
óó7 @
.
óó@ A
IdentityResources
óóA R
.
òò 
Select
òò 
(
òò 
x
òò 
=>
òò "
CreateScopeViewModel
òò -
(
òò- .
x
òò. /
,
òò/ 0
Input
òò1 6
==
òò7 9
null
òò: >
||
òò? A
Input
òòB G
.
òòG H
ScopesConsented
òòH W
.
òòW X
Contains
òòX `
(
òò` a
x
òòa b
.
òòb c
Name
òòc g
)
òòg h
)
òòh i
)
òòi j
.
ôô 
ToArray
ôô 
(
ôô 
)
ôô 
;
ôô 
var
õõ  
resourceIndicators
õõ 
=
õõ  
request
õõ! (
.
õõ( ))
RequestedResourceIndicators
õõ) D
??
õõE G

Enumerable
õõH R
.
õõR S
Empty
õõS X
<
õõX Y
string
õõY _
>
õõ_ `
(
õõ` a
)
õõa b
;
õõb c
var
úú 
apiResources
úú 
=
úú 
request
úú "
.
úú" # 
ValidatedResources
úú# 5
.
úú5 6
	Resources
úú6 ?
.
úú? @
ApiResources
úú@ L
.
úúL M
Where
úúM R
(
úúR S
x
úúS T
=>
úúU W 
resourceIndicators
úúX j
.
úúj k
Contains
úúk s
(
úús t
x
úút u
.
úúu v
Name
úúv z
)
úúz {
)
úú{ |
;
úú| }
var
ûû 
	apiScopes
ûû 
=
ûû 
new
ûû 
List
ûû  
<
ûû  !
ScopeViewModel
ûû! /
>
ûû/ 0
(
ûû0 1
)
ûû1 2
;
ûû2 3
foreach
üü 
(
üü 
var
üü 
parsedScope
üü  
in
üü! #
request
üü$ +
.
üü+ , 
ValidatedResources
üü, >
.
üü> ?
ParsedScopes
üü? K
)
üüK L
{
†† 	
var
°° 
apiScope
°° 
=
°° 
request
°° "
.
°°" # 
ValidatedResources
°°# 5
.
°°5 6
	Resources
°°6 ?
.
°°? @
FindApiScope
°°@ L
(
°°L M
parsedScope
°°M X
.
°°X Y

ParsedName
°°Y c
)
°°c d
;
°°d e
if
¢¢ 
(
¢¢ 
apiScope
¢¢ 
!=
¢¢ 
null
¢¢  
)
¢¢  !
{
££ 
var
§§ 
scopeVm
§§ 
=
§§ "
CreateScopeViewModel
§§ 2
(
§§2 3
parsedScope
§§3 >
,
§§> ?
apiScope
§§@ H
,
§§H I
Input
§§J O
==
§§P R
null
§§S W
||
§§X Z
Input
§§[ `
.
§§` a
ScopesConsented
§§a p
.
§§p q
Contains
§§q y
(
§§y z
parsedScope§§z Ö
.§§Ö Ü
RawValue§§Ü é
)§§é è
)§§è ê
;§§ê ë
scopeVm
•• 
.
•• 
	Resources
•• !
=
••" #
apiResources
••$ 0
.
••0 1
Where
••1 6
(
••6 7
x
••7 8
=>
••9 ;
x
••< =
.
••= >
Scopes
••> D
.
••D E
Contains
••E M
(
••M N
parsedScope
••N Y
.
••Y Z

ParsedName
••Z d
)
••d e
)
••e f
.
¶¶ 
Select
¶¶ 
(
¶¶ 
x
¶¶ 
=>
¶¶  
new
¶¶! $
ResourceViewModel
¶¶% 6
{
ßß 
Name
®® 
=
®® 
x
®®  
.
®®  !
Name
®®! %
,
®®% &
DisplayName
©© #
=
©©$ %
x
©©& '
.
©©' (
DisplayName
©©( 3
??
©©4 6
x
©©7 8
.
©©8 9
Name
©©9 =
,
©©= >
}
™™ 
)
™™ 
.
™™ 
ToArray
™™ 
(
™™ 
)
™™  
;
™™  !
	apiScopes
´´ 
.
´´ 
Add
´´ 
(
´´ 
scopeVm
´´ %
)
´´% &
;
´´& '
}
¨¨ 
}
≠≠ 	
if
ÆÆ 

(
ÆÆ 
ConsentOptions
ÆÆ 
.
ÆÆ !
EnableOfflineAccess
ÆÆ .
&&
ÆÆ/ 1
request
ÆÆ2 9
.
ÆÆ9 : 
ValidatedResources
ÆÆ: L
.
ÆÆL M
	Resources
ÆÆM V
.
ÆÆV W
OfflineAccess
ÆÆW d
)
ÆÆd e
{
ØØ 	
	apiScopes
∞∞ 
.
∞∞ 
Add
∞∞ 
(
∞∞ #
GetOfflineAccessScope
∞∞ /
(
∞∞/ 0
Input
∞∞0 5
==
∞∞6 8
null
∞∞9 =
||
∞∞> @
Input
∞∞A F
.
∞∞F G
ScopesConsented
∞∞G V
.
∞∞V W
Contains
∞∞W _
(
∞∞_ `
Duende
∞∞` f
.
∞∞f g
IdentityServer
∞∞g u
.
∞∞u v&
IdentityServerConstants∞∞v ç
.∞∞ç é
StandardScopes∞∞é ú
.∞∞ú ù
OfflineAccess∞∞ù ™
)∞∞™ ´
)∞∞´ ¨
)∞∞¨ ≠
;∞∞≠ Æ
}
±± 	
vm
≤≤ 

.
≤≤
 
	ApiScopes
≤≤ 
=
≤≤ 
	apiScopes
≤≤  
;
≤≤  !
return
¥¥ 
vm
¥¥ 
;
¥¥ 
}
µµ 
private
∑∑ 
static
∑∑ 
ScopeViewModel
∑∑ !"
CreateScopeViewModel
∑∑" 6
(
∑∑6 7
IdentityResource
∑∑7 G
identity
∑∑H P
,
∑∑P Q
bool
∑∑R V
check
∑∑W \
)
∑∑\ ]
{
∏∏ 
return
ππ 
new
ππ 
ScopeViewModel
ππ !
{
∫∫ 	
Name
ªª 
=
ªª 
identity
ªª 
.
ªª 
Name
ªª  
,
ªª  !
Value
ºº 
=
ºº 
identity
ºº 
.
ºº 
Name
ºº !
,
ºº! "
DisplayName
ΩΩ 
=
ΩΩ 
identity
ΩΩ "
.
ΩΩ" #
DisplayName
ΩΩ# .
??
ΩΩ/ 1
identity
ΩΩ2 :
.
ΩΩ: ;
Name
ΩΩ; ?
,
ΩΩ? @
Description
ææ 
=
ææ 
identity
ææ "
.
ææ" #
Description
ææ# .
,
ææ. /
	Emphasize
øø 
=
øø 
identity
øø  
.
øø  !
	Emphasize
øø! *
,
øø* +
Required
¿¿ 
=
¿¿ 
identity
¿¿ 
.
¿¿  
Required
¿¿  (
,
¿¿( )
Checked
¡¡ 
=
¡¡ 
check
¡¡ 
||
¡¡ 
identity
¡¡ '
.
¡¡' (
Required
¡¡( 0
}
¬¬ 	
;
¬¬	 

}
√√ 
private
≈≈ 
static
≈≈ 
ScopeViewModel
≈≈ !"
CreateScopeViewModel
≈≈" 6
(
≈≈6 7
ParsedScopeValue
≈≈7 G
parsedScopeValue
≈≈H X
,
≈≈X Y
ApiScope
≈≈Z b
apiScope
≈≈c k
,
≈≈k l
bool
≈≈m q
check
≈≈r w
)
≈≈w x
{
∆∆ 
var
«« 
displayName
«« 
=
«« 
apiScope
«« "
.
««" #
DisplayName
««# .
??
««/ 1
apiScope
««2 :
.
««: ;
Name
««; ?
;
««? @
if
»» 

(
»» 
!
»» 
String
»» 
.
»»  
IsNullOrWhiteSpace
»» &
(
»»& '
parsedScopeValue
»»' 7
.
»»7 8
ParsedParameter
»»8 G
)
»»G H
)
»»H I
{
…… 	
displayName
   
+=
   
$str
   
+
    
parsedScopeValue
  ! 1
.
  1 2
ParsedParameter
  2 A
;
  A B
}
ÀÀ 	
return
ÕÕ 
new
ÕÕ 
ScopeViewModel
ÕÕ !
{
ŒŒ 	
Name
œœ 
=
œœ 
parsedScopeValue
œœ #
.
œœ# $

ParsedName
œœ$ .
,
œœ. /
Value
–– 
=
–– 
parsedScopeValue
–– $
.
––$ %
RawValue
––% -
,
––- .
DisplayName
—— 
=
—— 
displayName
—— %
,
——% &
Description
““ 
=
““ 
apiScope
““ "
.
““" #
Description
““# .
,
““. /
	Emphasize
”” 
=
”” 
apiScope
””  
.
””  !
	Emphasize
””! *
,
””* +
Required
‘‘ 
=
‘‘ 
apiScope
‘‘ 
.
‘‘  
Required
‘‘  (
,
‘‘( )
Checked
’’ 
=
’’ 
check
’’ 
||
’’ 
apiScope
’’ '
.
’’' (
Required
’’( 0
}
÷÷ 	
;
÷÷	 

}
◊◊ 
private
ŸŸ 
static
ŸŸ 
ScopeViewModel
ŸŸ !#
GetOfflineAccessScope
ŸŸ" 7
(
ŸŸ7 8
bool
ŸŸ8 <
check
ŸŸ= B
)
ŸŸB C
{
⁄⁄ 
return
€€ 
new
€€ 
ScopeViewModel
€€ !
{
‹‹ 	
Value
›› 
=
›› 
Duende
›› 
.
›› 
IdentityServer
›› )
.
››) *%
IdentityServerConstants
››* A
.
››A B
StandardScopes
››B P
.
››P Q
OfflineAccess
››Q ^
,
››^ _
DisplayName
ﬁﬁ 
=
ﬁﬁ 
ConsentOptions
ﬁﬁ (
.
ﬁﬁ( )&
OfflineAccessDisplayName
ﬁﬁ) A
,
ﬁﬁA B
Description
ﬂﬂ 
=
ﬂﬂ 
ConsentOptions
ﬂﬂ (
.
ﬂﬂ( )&
OfflineAccessDescription
ﬂﬂ) A
,
ﬂﬂA B
	Emphasize
‡‡ 
=
‡‡ 
true
‡‡ 
,
‡‡ 
Checked
·· 
=
·· 
check
·· 
}
‚‚ 	
;
‚‚	 

}
„„ 
}‰‰ Ö
dC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Ciba\All.cshtml.cs
	namespace		 	
EdoAuthServer		
 
.		 
UI		 
.		 
Pages		  
.		  !
Ciba		! %
;		% &
[ 
SecurityHeaders 
] 
[ 
	Authorize 

]
 
public 
class 
AllModel 
: 
	PageModel !
{ 
public 

IEnumerable 
< '
BackchannelUserLoginRequest 2
>2 3
Logins4 :
{; <
get= @
;@ A
setB E
;E F
}G H
=I J
defaultK R
!R S
;S T
private 
readonly 8
,IBackchannelAuthenticationInteractionService A1
%_backchannelAuthenticationInteractionB g
;g h
public 

AllModel 
( 8
,IBackchannelAuthenticationInteractionService @7
+backchannelAuthenticationInteractionServiceA l
)l m
{ 1
%_backchannelAuthenticationInteraction -
=. /7
+backchannelAuthenticationInteractionService0 [
;[ \
} 
public 

async 
Task 
OnGet 
( 
) 
{ 
Logins 
= 
await 1
%_backchannelAuthenticationInteraction <
.< =6
*GetPendingLoginRequestsForCurrentUserAsync= g
(g h
)h i
;i j
} 
} Œ
qC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Logout\LogoutOptions.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Logout! '
;' (
public 
static 
class 
LogoutOptions !
{ 
public		 

static		 
readonly		 
bool		 
ShowLogoutPrompt		  0
=		1 2
true		3 7
;		7 8
public

 

static

 
readonly

 
bool

 )
AutomaticRedirectAfterSignOut

  =
=

> ?
false

@ E
;

E F
} ¡
vC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Logout\LoggedOutViewModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Logout! '
;' (
public		 
class		 
LoggedOutViewModel		 
{

 
public 

string 
? !
PostLogoutRedirectUri (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 

string 
? 

ClientName 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
? 
SignOutIframeUrl #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 

bool )
AutomaticRedirectAfterSignOut -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} Â
tC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Logout\LoggedOut.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Logout! '
;' (
[

 
SecurityHeaders

 
]

 
[ 
AllowAnonymous 
] 
public 
class 
	LoggedOut 
: 
	PageModel "
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interactionService7 J
;J K
public 

LoggedOutViewModel 
View "
{# $
get% (
;( )
set* -
;- .
}/ 0
=1 2
default3 :
!: ;
;; <
public 

	LoggedOut 
( -
!IIdentityServerInteractionService 6
interactionService7 I
)I J
{ 
_interactionService 
= 
interactionService 0
;0 1
} 
public 

async 
Task 
OnGet 
( 
string "
?" #
logoutId$ ,
), -
{ 
var 
logout 
= 
await 
_interactionService .
.. /!
GetLogoutContextAsync/ D
(D E
logoutIdE M
)M N
;N O
View 
= 
new 
LoggedOutViewModel %
{ 	)
AutomaticRedirectAfterSignOut )
=* +
LogoutOptions, 9
.9 :)
AutomaticRedirectAfterSignOut: W
,W X!
PostLogoutRedirectUri !
=" #
logout$ *
?* +
.+ ,!
PostLogoutRedirectUri, A
,A B

ClientName   
=   
String   
.    
IsNullOrEmpty    -
(  - .
logout  . 4
?  4 5
.  5 6

ClientName  6 @
)  @ A
?  B C
logout  D J
?  J K
.  K L
ClientId  L T
:  U V
logout  W ]
?  ] ^
.  ^ _

ClientName  _ i
,  i j
SignOutIframeUrl!! 
=!! 
logout!! %
?!!% &
.!!& '
SignOutIFrameUrl!!' 7
}"" 	
;""	 

}## 
}$$ é.
pC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Logout\Index.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Logout! '
;' (
[ 
SecurityHeaders 
] 
[ 
AllowAnonymous 
] 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IEventService "
_events# *
;* +
[ 
BindProperty 
] 
public 

string 
? 
LogoutId 
{ 
get !
;! "
set# &
;& '
}( )
public 

Index 
( -
!IIdentityServerInteractionService 2
interaction3 >
,> ?
IEventService@ M
eventsN T
)T U
{ 
_interaction 
= 
interaction "
;" #
_events 
= 
events 
; 
} 
public 

async 
Task 
< 
IActionResult #
># $
OnGet% *
(* +
string+ 1
?1 2
logoutId3 ;
); <
{   
LogoutId!! 
=!! 
logoutId!! 
;!! 
var## 
showLogoutPrompt## 
=## 
LogoutOptions## ,
.##, -
ShowLogoutPrompt##- =
;##= >
if%% 

(%% 
User%% 
.%% 
Identity%% 
?%% 
.%% 
IsAuthenticated%% *
!=%%+ -
true%%. 2
)%%2 3
{&& 	
showLogoutPrompt(( 
=(( 
false(( $
;(($ %
})) 	
else** 
{++ 	
var,, 
context,, 
=,, 
await,, 
_interaction,,  ,
.,,, -!
GetLogoutContextAsync,,- B
(,,B C
LogoutId,,C K
),,K L
;,,L M
if-- 
(-- 
context-- 
?-- 
.-- 
ShowSignoutPrompt-- *
==--+ -
false--. 3
)--3 4
{.. 
showLogoutPrompt00  
=00! "
false00# (
;00( )
}11 
}22 	
if44 

(44 
showLogoutPrompt44 
==44 
false44  %
)44% &
{55 	
return88 
await88 
OnPost88 
(88  
)88  !
;88! "
}99 	
return;; 
Page;; 
(;; 
);; 
;;; 
}<< 
public>> 

async>> 
Task>> 
<>> 
IActionResult>> #
>>># $
OnPost>>% +
(>>+ ,
)>>, -
{?? 
if@@ 

(@@ 
User@@ 
.@@ 
Identity@@ 
?@@ 
.@@ 
IsAuthenticated@@ *
==@@+ -
true@@. 2
)@@2 3
{AA 	
LogoutIdEE 
??=EE 
awaitEE 
_interactionEE +
.EE+ ,$
CreateLogoutContextAsyncEE, D
(EED E
)EEE F
;EEF G
awaitHH 
HttpContextHH 
.HH 
SignOutAsyncHH *
(HH* +
)HH+ ,
;HH, -
varKK 
idpKK 
=KK 
UserKK 
.KK 
	FindFirstKK $
(KK$ %
JwtClaimTypesKK% 2
.KK2 3
IdentityProviderKK3 C
)KKC D
?KKD E
.KKE F
ValueKKF K
;KKK L
awaitNN 
_eventsNN 
.NN 

RaiseAsyncNN $
(NN$ %
newNN% ("
UserLogoutSuccessEventNN) ?
(NN? @
UserNN@ D
.NND E
GetSubjectIdNNE Q
(NNQ R
)NNR S
,NNS T
UserNNU Y
.NNY Z
GetDisplayNameNNZ h
(NNh i
)NNi j
)NNj k
)NNk l
;NNl m
	TelemetryOO 
.OO 
MetricsOO 
.OO 

UserLogoutOO (
(OO( )
idpOO) ,
)OO, -
;OO- .
ifRR 
(RR 
idpRR 
!=RR 
nullRR 
&&RR 
idpRR "
!=RR# %
DuendeRR& ,
.RR, -
IdentityServerRR- ;
.RR; <#
IdentityServerConstantsRR< S
.RRS T!
LocalIdentityProviderRRT i
)RRi j
{SS 
ifUU 
(UU 
awaitUU 
HttpContextUU %
.UU% &)
GetSchemeSupportsSignOutAsyncUU& C
(UUC D
idpUUD G
)UUG H
)UUH I
{VV 
varZZ 
urlZZ 
=ZZ 
UrlZZ !
.ZZ! "
PageZZ" &
(ZZ& '
$strZZ' B
,ZZB C
newZZD G
{ZZH I
logoutIdZZJ R
=ZZS T
LogoutIdZZU ]
}ZZ^ _
)ZZ_ `
;ZZ` a
return]] 
SignOut]] "
(]]" #
new]]# &$
AuthenticationProperties]]' ?
{]]@ A
RedirectUri]]B M
=]]N O
url]]P S
}]]T U
,]]U V
idp]]W Z
)]]Z [
;]][ \
}^^ 
}__ 
}`` 	
returnbb 
RedirectToPagebb 
(bb 
$strbb 9
,bb9 :
newbb; >
{bb? @
logoutIdbbA I
=bbJ K
LogoutIdbbL T
}bbU V
)bbV W
;bbW X
}cc 
}dd ó
lC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Login\ViewModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Login! &
;& '
public 
class 
	ViewModel 
{ 
public 

bool 
AllowRememberLogin "
{# $
get% (
;( )
set* -
;- .
}/ 0
=1 2
true3 7
;7 8
public		 

bool		 
EnableLocalLogin		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
=		/ 0
true		1 5
;		5 6
public 

IEnumerable 
< 
	ViewModel  
.  !
ExternalProvider! 1
>1 2
ExternalProviders3 D
{E F
getG J
;J K
setL O
;O P
}Q R
=S T

EnumerableU _
._ `
Empty` e
<e f
ExternalProviderf v
>v w
(w x
)x y
;y z
public 

IEnumerable 
< 
	ViewModel  
.  !
ExternalProvider! 1
>1 2$
VisibleExternalProviders3 K
=>L N
ExternalProvidersO `
.` a
Wherea f
(f g
xg h
=>i k
!l m
Stringm s
.s t
IsNullOrWhiteSpace	t Ü
(
Ü á
x
á à
.
à â
DisplayName
â î
)
î ï
)
ï ñ
;
ñ ó
public 

bool 
IsExternalLoginOnly #
=>$ &
EnableLocalLogin' 7
==8 :
false; @
&&A C
ExternalProvidersD U
?U V
.V W
CountW \
(\ ]
)] ^
==_ a
$numb c
;c d
public 

string 
? 
ExternalLoginScheme &
=>' )
IsExternalLoginOnly* =
?> ?
ExternalProviders@ Q
?Q R
.R S
SingleOrDefaultS b
(b c
)c d
?d e
.e f 
AuthenticationSchemef z
:{ |
null	} Å
;
Å Ç
public 

class 
ExternalProvider !
{ 
public 
ExternalProvider 
(  
string  & 
authenticationScheme' ;
,; <
string= C
?C D
displayNameE P
=Q R
nullS W
)W X
{ 	 
AuthenticationScheme  
=! " 
authenticationScheme# 7
;7 8
DisplayName 
= 
displayName %
;% &
} 	
public 
string 
? 
DisplayName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string  
AuthenticationScheme *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} Ì
oC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Login\LoginOptions.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Login! &
;& '
public 
static 
class 
LoginOptions  
{ 
public 

static 
readonly 
bool 
AllowLocalLogin  /
=0 1
true2 6
;6 7
public		 

static		 
readonly		 
bool		 
AllowRememberLogin		  2
=		3 4
true		5 9
;		9 :
public

 

static

 
readonly

 
TimeSpan

 ##
RememberMeLoginDuration

$ ;
=

< =
TimeSpan

> F
.

F G
FromDays

G O
(

O P
$num

P R
)

R S
;

S T
public 

static 
readonly 
string !*
InvalidCredentialsErrorMessage" @
=A B
$strC a
;a b
} ö

mC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Login\InputModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Login! &
;& '
public 
class 

InputModel 
{		 
[

 
Required

 
]

 
public 

string 
? 
Username 
{ 
get !
;! "
set# &
;& '
}( )
[ 
Required 
] 
public 

string 
? 
Password 
{ 
get !
;! "
set# &
;& '
}( )
public 

bool 
RememberLogin 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
? 
	ReturnUrl 
{ 
get "
;" #
set$ '
;' (
}) *
public 

string 
? 
Button 
{ 
get 
;  
set! $
;$ %
}& '
} ìá
oC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Login\Index.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Login! &
;& '
[ 
SecurityHeaders 
] 
[ 
AllowAnonymous 
] 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IEventService "
_events# *
;* +
private 
readonly )
IAuthenticationSchemeProvider 2
_schemeProvider3 B
;B C
private 
readonly "
IIdentityProviderStore +"
_identityProviderStore, B
;B C
private 
readonly 
SignInManager "
<" #
ApplicationUser# 2
>2 3
_signInManager4 B
;B C
private 
readonly 
UserManager  
<  !
ApplicationUser! 0
>0 1
_userManager2 >
;> ?
public 

	ViewModel 
View 
{ 
get 
;  
set! $
;$ %
}& '
=( )
default* 1
!1 2
;2 3
[ 
BindProperty 
] 
public   


InputModel   
Input   
{   
get   !
;  ! "
set  # &
;  & '
}  ( )
=  * +
default  , 3
!  3 4
;  4 5
public"" 

Index"" 
("" -
!IIdentityServerInteractionService## )
interaction##* 5
,##5 6)
IAuthenticationSchemeProvider$$ %
schemeProvider$$& 4
,$$4 5"
IIdentityProviderStore%% !
identityProviderStore%% 4
,%%4 5
IEventService&& 
events&& 
,&& 
SignInManager'' 
<'' 
ApplicationUser'' %
>''% &
signInManager''' 4
,''4 5
UserManager(( 
<(( 
ApplicationUser(( #
>((# $
userManager((% 0
)((0 1
{)) 
_interaction** 
=** 
interaction** "
;**" #
_schemeProvider++ 
=++ 
schemeProvider++ (
;++( )"
_identityProviderStore,, 
=,,  !
identityProviderStore,,! 6
;,,6 7
_events-- 
=-- 
events-- 
;-- 
_signInManager.. 
=.. 
signInManager.. &
;..& '
_userManager// 
=// 
userManager// "
;//" #
}00 
public22 

async22 
Task22 
<22 
IActionResult22 #
>22# $
OnGet22% *
(22* +
string22+ 1
?221 2
	returnUrl223 <
)22< =
{33 
await44 
BuildModelAsync44 
(44 
	returnUrl44 '
)44' (
;44( )
if66 

(66 
View66 
.66 
IsExternalLoginOnly66 $
)66$ %
{77 	
return99 
RedirectToPage99 !
(99! "
$str99" <
,99< =
new99> A
{99B C
scheme99D J
=99K L
View99M Q
.99Q R
ExternalLoginScheme99R e
,99e f
	returnUrl99g p
}99q r
)99r s
;99s t
}:: 	
return<< 
Page<< 
(<< 
)<< 
;<< 
}== 
public?? 

async?? 
Task?? 
<?? 
IActionResult?? #
>??# $
OnPost??% +
(??+ ,
)??, -
{@@ 
varAA 
contextAA 
=AA 
awaitAA 
_interactionAA (
.AA( )(
GetAuthorizationContextAsyncAA) E
(AAE F
InputAAF K
.AAK L
	ReturnUrlAAL U
)AAU V
;AAV W
ifDD 

(DD 
InputDD 
.DD 
ButtonDD 
!=DD 
$strDD #
)DD# $
{EE 	
ifFF 
(FF 
contextFF 
!=FF 
nullFF 
)FF  
{GG 
awaitHH 
_interactionHH "
.HH" #"
DenyAuthorizationAsyncHH# 9
(HH9 :
contextHH: A
,HHA B
AuthorizationErrorHHC U
.HHU V
AccessDeniedHHV b
)HHb c
;HHc d
ifII 
(II 
contextII 
.II 
IsNativeClientII *
(II* +
)II+ ,
)II, -
returnJJ 
thisJJ 
.JJ  
LoadingPageJJ  +
(JJ+ ,
InputJJ, 1
.JJ1 2
	ReturnUrlJJ2 ;
)JJ; <
;JJ< =
returnLL 
RedirectLL 
(LL  
InputLL  %
.LL% &
	ReturnUrlLL& /
??LL0 2
$strLL3 7
)LL7 8
;LL8 9
}MM 
returnOO 
RedirectOO 
(OO 
$strOO  
)OO  !
;OO! "
}PP 	
ifRR 

(RR 

ModelStateRR 
.RR 
IsValidRR 
)RR 
{SS 	
varUU 
userUU 
=UU 
awaitUU 
_userManagerUU )
.UU) *
FindByNameAsyncUU* 9
(UU9 :
InputUU: ?
.UU? @
UsernameUU@ H
)UUH I
;UUI J
ifVV 
(VV 
userVV 
!=VV 
nullVV 
)VV 
{WW 
varXX 
resultXX 
=XX 
awaitXX "
_signInManagerXX# 1
.XX1 2$
CheckPasswordSignInAsyncXX2 J
(XXJ K
userXXK O
,XXO P
InputXXQ V
.XXV W
PasswordXXW _
,XX_ `
falseXXa f
)XXf g
;XXg h
ifYY 
(YY 
resultYY 
.YY 
	SucceededYY $
)YY$ %
{ZZ 
await[[ 
_events[[ !
.[[! "

RaiseAsync[[" ,
([[, -
new[[- 0!
UserLoginSuccessEvent[[1 F
([[F G
user[[G K
.[[K L
UserName[[L T
,[[T U
user[[V Z
.[[Z [
Id[[[ ]
,[[] ^
user[[_ c
.[[c d
UserName[[d l
,[[l m
clientId[[n v
:[[v w
context[[x 
?	[[ Ä
.
[[Ä Å
Client
[[Å á
.
[[á à
ClientId
[[à ê
)
[[ê ë
)
[[ë í
;
[[í ì
var]] 
props]] 
=]] 
new]]  #$
AuthenticationProperties]]$ <
(]]< =
)]]= >
;]]> ?
if^^ 
(^^ 
LoginOptions^^ $
.^^$ %
AllowRememberLogin^^% 7
&&^^8 :
Input^^; @
.^^@ A
RememberLogin^^A N
)^^N O
{__ 
props`` 
.`` 
IsPersistent`` *
=``+ ,
true``- 1
;``1 2
propsaa 
.aa 

ExpiresUtcaa (
=aa) *
DateTimeOffsetaa+ 9
.aa9 :
UtcNowaa: @
.aa@ A
AddaaA D
(aaD E
LoginOptionsaaE Q
.aaQ R#
RememberMeLoginDurationaaR i
)aai j
;aaj k
}bb 
vardd 
isuserdd 
=dd  
newdd! $
IdentityServerUserdd% 7
(dd7 8
userdd8 <
.dd< =
Iddd= ?
)dd? @
{ee 
DisplayNameff #
=ff$ %
userff& *
.ff* +
UserNameff+ 3
}gg 
;gg 
awaitii 
HttpContextii %
.ii% &
SignInAsyncii& 1
(ii1 2
isuserii2 8
,ii8 9
propsii: ?
)ii? @
;ii@ A
ifkk 
(kk 
contextkk 
!=kk  "
nullkk# '
)kk' (
{ll 
ifmm 
(mm 
contextmm #
.mm# $
IsNativeClientmm$ 2
(mm2 3
)mm3 4
)mm4 5
returnnn "
thisnn# '
.nn' (
LoadingPagenn( 3
(nn3 4
Inputnn4 9
.nn9 :
	ReturnUrlnn: C
)nnC D
;nnD E
returnpp 
Redirectpp '
(pp' (
Inputpp( -
.pp- .
	ReturnUrlpp. 7
??pp8 :
$strpp; ?
)pp? @
;pp@ A
}qq 
ifss 
(ss 
Urlss 
.ss 

IsLocalUrlss &
(ss& '
Inputss' ,
.ss, -
	ReturnUrlss- 6
)ss6 7
)ss7 8
returntt 
Redirecttt '
(tt' (
Inputtt( -
.tt- .
	ReturnUrltt. 7
)tt7 8
;tt8 9
elseuu 
ifuu 
(uu 
stringuu #
.uu# $
IsNullOrEmptyuu$ 1
(uu1 2
Inputuu2 7
.uu7 8
	ReturnUrluu8 A
)uuA B
)uuB C
returnvv 
Redirectvv '
(vv' (
$strvv( ,
)vv, -
;vv- .
elseww 
throwxx 
newxx !
ArgumentExceptionxx" 3
(xx3 4
$strxx4 H
)xxH I
;xxI J
}yy 
}zz 
const|| 
string|| 
error|| 
=||  
$str||! 6
;||6 7
await}} 
_events}} 
.}} 

RaiseAsync}} $
(}}$ %
new}}% (!
UserLoginFailureEvent}}) >
(}}> ?
Input}}? D
.}}D E
Username}}E M
,}}M N
error}}O T
,}}T U
clientId}}V ^
:}}^ _
context}}` g
?}}g h
.}}h i
Client}}i o
.}}o p
ClientId}}p x
)}}x y
)}}y z
;}}z {

ModelState~~ 
.~~ 
AddModelError~~ $
(~~$ %
string~~% +
.~~+ ,
Empty~~, 1
,~~1 2
LoginOptions~~3 ?
.~~? @*
InvalidCredentialsErrorMessage~~@ ^
)~~^ _
;~~_ `
} 	
await
ÅÅ 
BuildModelAsync
ÅÅ 
(
ÅÅ 
Input
ÅÅ #
.
ÅÅ# $
	ReturnUrl
ÅÅ$ -
)
ÅÅ- .
;
ÅÅ. /
return
ÇÇ 
Page
ÇÇ 
(
ÇÇ 
)
ÇÇ 
;
ÇÇ 
}
ÉÉ 
private
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
BuildModelAsync
ÖÖ &
(
ÖÖ& '
string
ÖÖ' -
?
ÖÖ- .
	returnUrl
ÖÖ/ 8
)
ÖÖ8 9
{
ÜÜ 
Input
áá 
=
áá 
new
áá 

InputModel
áá 
{
áá  
	ReturnUrl
áá! *
=
áá+ ,
	returnUrl
áá- 6
}
áá7 8
;
áá8 9
var
ââ 
context
ââ 
=
ââ 
await
ââ 
_interaction
ââ (
.
ââ( )*
GetAuthorizationContextAsync
ââ) E
(
ââE F
	returnUrl
ââF O
)
ââO P
;
ââP Q
if
ää 

(
ää 
context
ää 
?
ää 
.
ää 
IdP
ää 
!=
ää 
null
ää  
&&
ää! #
await
ää$ )
_schemeProvider
ää* 9
.
ää9 :
GetSchemeAsync
ää: H
(
ääH I
context
ääI P
.
ääP Q
IdP
ääQ T
)
ääT U
!=
ääV X
null
ääY ]
)
ää] ^
{
ãã 	
var
åå 
local
åå 
=
åå 
context
åå 
.
åå  
IdP
åå  #
==
åå$ &%
IdentityServerConstants
åå' >
.
åå> ?#
LocalIdentityProvider
åå? T
;
ååT U
View
çç 
=
çç 
new
çç 
	ViewModel
çç  
{
éé 
EnableLocalLogin
èè  
=
èè! "
local
èè# (
}
êê 
;
êê 
Input
íí 
.
íí 
Username
íí 
=
íí 
context
íí $
.
íí$ %
	LoginHint
íí% .
;
íí. /
if
îî 
(
îî 
!
îî 
local
îî 
)
îî 
{
ïï 
View
ññ 
.
ññ 
ExternalProviders
ññ &
=
ññ' (
new
ññ) ,
[
ññ, -
]
ññ- .
{
óó 
new
òò 
	ViewModel
òò !
.
òò! "
ExternalProvider
òò" 2
(
òò2 3"
authenticationScheme
òò3 G
:
òòG H
context
òòI P
.
òòP Q
IdP
òòQ T
)
òòT U
}
ôô 
;
ôô 
}
öö 
return
úú 
;
úú 
}
ùù 	
var
üü 
schemes
üü 
=
üü 
await
üü 
_schemeProvider
üü +
.
üü+ , 
GetAllSchemesAsync
üü, >
(
üü> ?
)
üü? @
;
üü@ A
var
†† 
	providers
†† 
=
†† 
schemes
†† 
.
°° 
Where
°° 
(
°° 
x
°° 
=>
°° 
x
°° 
.
°° 
DisplayName
°° %
!=
°°& (
null
°°) -
)
°°- .
.
¢¢ 
Select
¢¢ 
(
¢¢ 
x
¢¢ 
=>
¢¢ 
new
¢¢ 
	ViewModel
¢¢ &
.
¢¢& '
ExternalProvider
¢¢' 7
(
¢¢7 8"
authenticationScheme
££ $
:
££$ %
x
££& '
.
££' (
Name
££( ,
,
££, -
displayName
§§ 
:
§§ 
x
§§ 
.
§§ 
DisplayName
§§ *
??
§§+ -
x
§§. /
.
§§/ 0
Name
§§0 4
)
§§4 5
)
§§5 6
.
•• 
ToList
•• 
(
•• 
)
•• 
;
•• 
var
ßß 
dynamicSchemes
ßß 
=
ßß 
(
ßß 
await
ßß #$
_identityProviderStore
ßß$ :
.
ßß: ;$
GetAllSchemeNamesAsync
ßß; Q
(
ßßQ R
)
ßßR S
)
ßßS T
.
®® 
Where
®® 
(
®® 
x
®® 
=>
®® 
x
®® 
.
®® 
Enabled
®® !
)
®®! "
.
©© 
Select
©© 
(
©© 
x
©© 
=>
©© 
new
©© 
	ViewModel
©© &
.
©©& '
ExternalProvider
©©' 7
(
©©7 8"
authenticationScheme
™™ $
:
™™$ %
x
™™& '
.
™™' (
Scheme
™™( .
,
™™. /
displayName
´´ 
:
´´ 
x
´´ 
.
´´ 
DisplayName
´´ *
??
´´+ -
x
´´. /
.
´´/ 0
Scheme
´´0 6
)
´´6 7
)
´´7 8
;
´´8 9
	providers
≠≠ 
.
≠≠ 
AddRange
≠≠ 
(
≠≠ 
dynamicSchemes
≠≠ )
)
≠≠) *
;
≠≠* +
var
ØØ 

allowLocal
ØØ 
=
ØØ 
true
ØØ 
;
ØØ 
var
∞∞ 
client
∞∞ 
=
∞∞ 
context
∞∞ 
?
∞∞ 
.
∞∞ 
Client
∞∞ $
;
∞∞$ %
if
±± 

(
±± 
client
±± 
!=
±± 
null
±± 
)
±± 
{
≤≤ 	

allowLocal
≥≥ 
=
≥≥ 
client
≥≥ 
.
≥≥  
EnableLocalLogin
≥≥  0
;
≥≥0 1
if
¥¥ 
(
¥¥ 
client
¥¥ 
.
¥¥ *
IdentityProviderRestrictions
¥¥ 3
?
¥¥3 4
.
¥¥4 5
Count
¥¥5 :
>
¥¥; <
$num
¥¥= >
)
¥¥> ?
{
µµ 
	providers
∂∂ 
=
∂∂ 
	providers
∂∂ %
.
∑∑ 
Where
∑∑ 
(
∑∑ 
p
∑∑ 
=>
∑∑ 
client
∑∑  &
.
∑∑& '*
IdentityProviderRestrictions
∑∑' C
.
∑∑C D
Contains
∑∑D L
(
∑∑L M
p
∑∑M N
.
∑∑N O"
AuthenticationScheme
∑∑O c
)
∑∑c d
)
∑∑d e
.
∏∏ 
ToList
∏∏ 
(
∏∏ 
)
∏∏ 
;
∏∏ 
}
ππ 
}
∫∫ 	
View
ºº 
=
ºº 
new
ºº 
	ViewModel
ºº 
{
ΩΩ 	 
AllowRememberLogin
ææ 
=
ææ  
LoginOptions
ææ! -
.
ææ- . 
AllowRememberLogin
ææ. @
,
ææ@ A
EnableLocalLogin
øø 
=
øø 

allowLocal
øø )
&&
øø* ,
LoginOptions
øø- 9
.
øø9 :
AllowLocalLogin
øø: I
,
øøI J
ExternalProviders
¿¿ 
=
¿¿ 
	providers
¿¿  )
.
¿¿) *
ToArray
¿¿* 1
(
¿¿1 2
)
¿¿2 3
}
¡¡ 	
;
¡¡	 

}
¬¬ 
}√√ Ø$
nC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Create\InputModel.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Create! '
{ 
public 

class 

InputModel 
{ 
[ 	
Required	 
] 
public 
string 
? 
	ReturnUrl  
{! "
get# &
;& '
set( +
;+ ,
}- .
[

 	
Required

	 
]

 
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage &
=' (
$str) ?
)? @
]@ A
[ 	
Display	 
( 
Name 
= 
$str 
)  
]  !
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
default/ 6
!6 7
;7 8
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* ?
)? @
]@ A
[ 	
Display	 
( 
Name 
= 
$str *
)* +
]+ ,
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
default/ 6
!6 7
;7 8
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
MinimumLength '
=( )
$num* +
,+ ,
ErrorMessage- 9
=: ;
$str< R
)R S
]S T
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Display	 
( 
Name 
= 
$str  
)  !
]! "
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
default/ 6
!6 7
;7 8
[ 	
Required	 
] 
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
[ 	
Compare	 
( 
nameof 
( 
Password  
)  !
,! "
ErrorMessage# /
=0 1
$str2 I
)I J
]J K
[ 	
Display	 
( 
Name 
= 
$str .
). /
]/ 0
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
default6 =
!= >
;> ?
[   	
Required  	 
]   
[!! 	
Display!!	 
(!! 
Name!! 
=!! 
$str!! !
)!!! "
]!!" #
["" 	
RegularExpression""	 
("" 
$str"" *
,""* +
ErrorMessage"", 8
=""9 :
$str""; \
)""\ ]
]""] ^
public## 
string## 
Phone## 
{## 
get## !
;##! "
set### &
;##& '
}##( )
=##* +
default##, 3
!##3 4
;##4 5
[%% 	
Required%%	 
]%% 
[&& 	
EmailAddress&&	 
(&& 
ErrorMessage&& "
=&&# $
$str&&% 8
)&&8 9
]&&9 :
['' 	
Display''	 
('' 
Name'' 
='' 
$str'' 
)''  
]''  !
public(( 
string(( 
Email(( 
{(( 
get(( !
;((! "
set((# &
;((& '
}((( )
=((* +
default((, 3
!((3 4
;((4 5
public** 
string** 
?** 
Button** 
{** 
get**  #
;**# $
set**% (
;**( )
}*** +
}++ 
},, û9
pC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\Create\Index.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Create! '
{ 
[ 
SecurityHeaders 
] 
[ 
AllowAnonymous 
] 
public 

class 
Index 
: 
	PageModel "
{ 
private 
readonly 
UserManager $
<$ %
ApplicationUser% 4
>4 5
_userManager6 B
;B C
private 
readonly -
!IIdentityServerInteractionService :
_interaction; G
;G H
[ 	
BindProperty	 
] 
public 

InputModel 
Input 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
default0 7
!7 8
;8 9
public 
Index 
( -
!IIdentityServerInteractionService -
interaction. 9
,9 :
UserManager 
< 
ApplicationUser '
>' (
userManager) 4
)4 5
{ 	
_interaction 
= 
interaction &
;& '
_userManager 
= 
userManager &
;& '
} 	
public 
IActionResult 
OnGet "
(" #
string# )
?) *
	returnUrl+ 4
)4 5
{   	
Input!! 
=!! 
new!! 

InputModel!! "
{!!# $
	ReturnUrl!!% .
=!!/ 0
	returnUrl!!1 :
}!!; <
;!!< =
return"" 
Page"" 
("" 
)"" 
;"" 
}## 	
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
OnPost%%) /
(%%/ 0
)%%0 1
{&& 	
var'' 
context'' 
='' 
await'' 
_interaction''  ,
.'', -(
GetAuthorizationContextAsync''- I
(''I J
Input''J O
.''O P
	ReturnUrl''P Y
)''Y Z
;''Z [
if)) 
()) 
Input)) 
.)) 
Button)) 
!=)) 
$str))  (
)))( )
{** 
if++ 
(++ 
context++ 
!=++ 
null++ #
)++# $
{,, 
await-- 
_interaction-- &
.--& '"
DenyAuthorizationAsync--' =
(--= >
context--> E
,--E F
AuthorizationError--G Y
.--Y Z
AccessDenied--Z f
)--f g
;--g h
if// 
(// 
context// 
.//  
IsNativeClient//  .
(//. /
)/// 0
)//0 1
return00 
this00 #
.00# $
LoadingPage00$ /
(00/ 0
Input000 5
.005 6
	ReturnUrl006 ?
)00? @
;00@ A
return22 
Redirect22 #
(22# $
context22$ +
.22+ ,
RedirectUri22, 7
??228 :
$str22; ?
)22? @
;22@ A
}33 
return55 
Redirect55 
(55  
$str55  $
)55$ %
;55% &
}66 
if88 
(88 
await88 
_userManager88 "
.88" #
FindByNameAsync88# 2
(882 3
Input883 8
.888 9
UserName889 A
)88A B
!=88C E
null88F J
)88J K

ModelState99 
.99 
AddModelError99 (
(99( )
$str99) 9
,999 :
$str99; a
)99a b
;99b c
if;; 
(;; 
await;; 
_userManager;; "
.;;" #
FindByEmailAsync;;# 3
(;;3 4
Input;;4 9
.;;9 :
Email;;: ?
);;? @
!=;;A C
null;;D H
);;H I

ModelState<< 
.<< 
AddModelError<< (
(<<( )
$str<<) 6
,<<6 7
$str<<8 `
)<<` a
;<<a b
if>> 
(>> 
!>> 

ModelState>> 
.>> 
IsValid>> #
)>># $
return?? 
Page?? 
(?? 
)?? 
;?? 
varAA 
userAA 
=AA 
newAA 
ApplicationUserAA *
{BB 
UserNameCC 
=CC 
InputCC  
.CC  !
UserNameCC! )
,CC) *
FullNameDD 
=DD 
InputDD  
.DD  !
FullNameDD! )
,DD) *
EmailEE 
=EE 
InputEE 
.EE 
EmailEE #
,EE# $
PhoneNumberFF 
=FF 
InputFF #
.FF# $
PhoneFF$ )
,FF) *
EmailConfirmedGG 
=GG  
trueGG! %
}HH 
;HH 
varJJ 
resultJJ 
=JJ 
awaitJJ 
_userManagerJJ +
.JJ+ ,
CreateAsyncJJ, 7
(JJ7 8
userJJ8 <
,JJ< =
InputJJ> C
.JJC D
PasswordJJD L
)JJL M
;JJM N
ifKK 
(KK 
!KK 
resultKK 
.KK 
	SucceededKK !
)KK! "
{LL 
foreachMM 
(MM 
varMM 
eMM 
inMM !
resultMM" (
.MM( )
ErrorsMM) /
)MM/ 0

ModelStateNN 
.NN 
AddModelErrorNN ,
(NN, -
$strNN- /
,NN/ 0
eNN1 2
.NN2 3
DescriptionNN3 >
)NN> ?
;NN? @
returnOO 
PageOO 
(OO 
)OO 
;OO 
}PP 
varSS 
identityUserSS 
=SS 
newSS "
IdentityServerUserSS# 5
(SS5 6
userSS6 :
.SS: ;
IdSS; =
)SS= >
{TT 
DisplayNameUU 
=UU 
userUU "
.UU" #
FullNameUU# +
}VV 
;VV 
awaitXX 
HttpContextXX 
.XX 
SignInAsyncXX )
(XX) *
identityUserXX* 6
)XX6 7
;XX7 8
if[[ 
([[ 
context[[ 
!=[[ 
null[[ 
)[[  
{\\ 
if]] 
(]] 
context]] 
.]] 
IsNativeClient]] *
(]]* +
)]]+ ,
)]], -
return^^ 
this^^ 
.^^  
LoadingPage^^  +
(^^+ ,
context^^, 3
.^^3 4
RedirectUri^^4 ?
)^^? @
;^^@ A
return`` 
Redirect`` 
(``  
context``  '
.``' (
RedirectUri``( 3
)``3 4
;``4 5
}aa 
returndd 
Redirectdd 
(dd 
$strdd 5
)dd5 6
;dd6 7
}ee 	
}hh 
}ii è
pC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\EdoAuthServer.UI\Pages\Account\AccessDenied.cshtml.cs
	namespace 	
EdoAuthServer
 
. 
UI 
. 
Pages  
.  !
Account! (
;( )
public 
class 
AccessDeniedModel 
:  
	PageModel! *
{		 
public

 

void

 
OnGet

 
(

 
)

 
{ 
} 
} é
DC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\Config.cs
public 
static 
class 
Config 
{ 
public		 

static		 
IEnumerable		 
<		 
IdentityResource		 .
>		. /
IdentityResources		0 A
=>		B D
new

 
IdentityResource

 
[

 
]

 
{ 	
new 
IdentityResources !
.! "
OpenId" (
(( )
)) *
,* +
new 
IdentityResources !
.! "
Profile" )
() *
)* +
,+ ,
new 
IdentityResources !
.! "
Email" '
(' (
)( )
,) *
new 
IdentityResource  
{ 
Name 
= 
$str '
,' (
DisplayName 
= 
$str 3
,3 4

UserClaims 
= 
{ 
$str 3
,3 4
$str5 ;
}< =
} 
} 	
;	 

public 

static 
IEnumerable 
< 
ApiScope &
>& '
	ApiScopes( 1
=>2 4
new5 8
[8 9
]9 :
{ 
new 
ApiScope 
( 
$str !
,! "
$str# 0
)0 1
} 
; 
public$$ 

static$$ 
IEnumerable$$ 
<$$ 
Client$$ $
>$$$ %
Clients$$& -
=>$$. 0
new$$1 4
[$$4 5
]$$5 6
{%% 
new&& 
Client&& 
{'' 	
ClientId(( 
=(( 
$str(( 
,(( 

ClientName)) 
=)) 
$str)) &
,))& '
AllowedGrantTypes,, 
=,, 

GrantTypes,,  *
.,,* +
Code,,+ /
,,,/ 0
RequirePkce-- 
=-- 
true-- 
,-- 
RequireClientSecret.. 
=..  !
true.." &
,..& '
ClientSecrets// 
=// 
{// 
new// !
Secret//" (
(//( )
$str//) 1
.//1 2
Sha256//2 8
(//8 9
)//9 :
)//: ;
}//< =
,//= >
RedirectUris22 
=22 
{22% &
$str22' K
}22L M
,22M N"
PostLogoutRedirectUris33 "
=33# $
{33% &
$str33' U
}33V W
,33W X!
FrontChannelLogoutUri44 !
=44" #
$str44% J
,44J K
AllowedScopes77 
=77 
{77 
$str77 &
,77& '
$str77( 1
,771 2
$str773 :
,77: ;
$str77< L
,77L M
$str77N Z
}77[ \
,77\ ]
AllowOfflineAccess:: 
=::  
true::! %
,::% &,
 AlwaysIncludeUserClaimsInIdToken;; ,
=;;- .
true;;/ 3
}<< 	
}== 
;== 
}>> Õ
WC:\Users\Home PAVILION\source\repos\Edosign5\EdoAuthServer\Data\ApplicationDbContext.cs
	namespace 	
EdoAuthServer
 
. 
Data 
{ 
public 

class  
ApplicationDbContext %
:& '
IdentityDbContext( 9
<9 :
ApplicationUser: I
>I J
{ 
public		  
ApplicationDbContext		 #
(		# $
DbContextOptions		$ 4
<		4 5 
ApplicationDbContext		5 I
>		I J
options		K R
)		R S
:

 
base

 
(

 
options

 
)

 
{

 
}

 
} 
} 