á=
TC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\CartoesController.cs
	namespace		 	
MyWallet		
 
.		 
API		 
.		 
Controllers		 "
{

 
[ 	
	Authorize	 
] 
[ 	
Route	 
( 
$str !
)! "
]" #
[ 	
ApiController	 
] 
public 
class 
CartoesController &
:' (
ControllerBase) 7
{ 	
private 
readonly 
ICartaoRepositorio /
_cartaoRepositorio0 B
;B C
private 
readonly 
IDespesaRepositorio 0
_despesaRepositorio1 D
;D E
public 
CartoesController $
($ %
ICartaoRepositorio% 7
cartaoRepositorio8 I
,I J
IDespesaRepositorio 
despesaRepositorio  2
)2 3
{ 
_cartaoRepositorio "
=# $
cartaoRepositorio% 6
;6 7
_despesaRepositorio #
=$ %
despesaRepositorio& 8
;8 9
} 
[ 	
HttpGet	 
( 
$str 8
)8 9
]9 :
public 
async 
Task 
< 
IEnumerable %
<% &
Cartao& ,
>, -
>- .%
ObterCartoesPeloUsuarioId/ H
(H I
stringI O
	usuarioIdP Y
)Y Z
{ 	
return 
await 
_cartaoRepositorio +
.+ ,%
ObterCartoesPeloUsuarioId, E
(E F
	usuarioIdF O
)O P
.P Q
ToListAsyncQ \
(\ ]
)] ^
;^ _
} 	
[   	
HttpGet  	 
(   
$str   
)   
]   
public!! 
async!! 
Task!! 
<!! 
ActionResult!! &
<!!& '
Cartao!!' -
>!!- .
>!!. /
	GetCartao!!0 9
(!!9 :
int!!: =
id!!> @
)!!@ A
{"" 	
Cartao## 
cartao## 
=## 
await## !
_cartaoRepositorio##" 4
.##4 5
ObterPeloId##5 @
(##@ A
id##A C
)##C D
;##D E
if%% 
(%% 
cartao%% 
==%% 
null%% 
)%% 
return&& 
NotFound&& 
(&&  
)&&  !
;&&! "
return(( 
cartao(( 
;(( 
})) 	
[++ 	
HttpPut++	 
(++ 
$str++ 
)++ 
]++ 
public,, 
async,, 
Task,, 
<,, 
ActionResult,, &
>,,& '
	PutCartao,,( 1
(,,1 2
int,,2 5
id,,6 8
,,,8 9
Cartao,,: @
cartao,,A G
),,G H
{-- 	
if.. 
(.. 
id.. 
!=.. 
cartao.. 
... 
CartaoId.. %
)..% &
{// 
return00 

BadRequest00 !
(00! "
$str00" R
)00R S
;00S T
}11 
if33 
(33 

ModelState33 
.33 
IsValid33 "
)33" #
{44 
await55 
_cartaoRepositorio55 (
.55( )
	Atualizar55) 2
(552 3
cartao553 9
)559 :
;55: ;
return77 
Ok77 
(77 
new77 
{88 
mensagem99 
=99 
$"99 !
$str99! /
{99/ 0
cartao990 6
.996 7
Numero997 =
}99= >
$str99> U
"99U V
}:: 
):: 
;:: 
};; 
return== 

BadRequest== 
(== 
cartao== $
)==$ %
;==% &
}>> 	
[@@ 	
HttpPost@@	 
]@@ 
publicAA 
asyncAA 
TaskAA 
<AA 
ActionResultAA &
>AA& '

PostCartaoAA( 2
(AA2 3
CartaoAA3 9
cartaoAA: @
)AA@ A
{BB 	
ifCC 
(CC 

ModelStateCC 
.CC 
IsValidCC "
)CC" #
{DD 
awaitEE 
_cartaoRepositorioEE (
.EE( )
InserirEE) 0
(EE0 1
cartaoEE1 7
)EE7 8
;EE8 9
returnHH 
OkHH 
(HH 
newHH 
{II 
mensagemJJ 
=JJ 
$"JJ !
$strJJ! /
{JJ/ 0
cartaoJJ0 6
.JJ6 7
NumeroJJ7 =
}JJ= >
$strJJ> Q
"JJQ R
}KK 
)KK 
;KK 
}LL 
returnNN 

BadRequestNN 
(NN 
cartaoNN $
)NN$ %
;NN% &
}OO 	
[QQ 	

HttpDeleteQQ	 
(QQ 
$strQQ 
)QQ 
]QQ 
publicRR 
asyncRR 
TaskRR 
<RR 
ActionResultRR &
>RR& '
DeleteCartaoRR( 4
(RR4 5
intRR5 8
idRR9 ;
)RR; <
{SS 	
CartaoTT 
cartaoTT 
=TT 
awaitTT !
_cartaoRepositorioTT" 4
.TT4 5
ObterPeloIdTT5 @
(TT@ A
idTTA C
)TTC D
;TTD E
ifVV 
(VV 
cartaoVV 
==VV 
nullVV 
)VV 
returnWW 
NotFoundWW 
(WW  
)WW  !
;WW! "
IEnumerableYY 
<YY 
DespesaYY 
>YY  
despesasYY! )
=YY* +
awaitYY, 1
_despesaRepositorioYY2 E
.YYE F%
ObterDespesasPeloCartaoIdYYF _
(YY_ `
cartaoYY` f
.YYf g
CartaoIdYYg o
)YYo p
;YYp q
if[[ 
([[ 
despesas[[ 
!=[[ 
null[[  
)[[  !
{\\ 
return]] 
Ok]] 
(]] 
new^^ 
{__ 
Mensagem``  
=``! "
$"``# %
$str``% .
{``. /
cartao``0 6
.``6 7
Nome``7 ;
}``< =
$str``= }
"``} ~
,``~ 
Erroaa 
=aa 
trueaa #
}bb 
)bb 
;bb 
}cc 
awaitee 
_cartaoRepositorioee %
.ee% &
Excluiree& -
(ee- .
cartaoee. 4
)ee4 5
;ee5 6
returnhh 
Okhh 
(hh 
newhh 
{ii 
mensagemjj 
=jj 
$"jj 
$strjj +
{jj+ ,
cartaojj, 2
.jj2 3
Numerojj3 9
}jj9 :
$strjj: O
"jjO P
}kk 
)kk 
;kk 
}ll 	
[nn 	
HttpGetnn	 
(nn 
$strnn 0
)nn0 1
]nn1 2
publicoo 
asyncoo 
Taskoo 
<oo 
IEnumerableoo %
<oo% &
Cartaooo& ,
>oo, -
>oo- .
FiltrarCartoesoo/ =
(oo= >
stringoo> D
numeroCartaoooE Q
)ooQ R
{pp 	
returnqq 
awaitqq 
_cartaoRepositorioqq +
.qq+ ,
FiltrarCartoesqq, :
(qq: ;
numeroCartaoqq; G
)qqG H
.qqH I
ToListAsyncqqI T
(qqT U
)qqU V
;qqV W
}rr 	
}ss 
}tt ≥`
WC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\CategoriasController.cs
	namespace		 	
MyWallet		
 
.		 
API		 
.		 
Controllers		 "
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class  
CategoriasController %
:& '
ControllerBase( 6
{ 
private 
readonly !
ICategoriaRepositorio .!
_categoriaRepositorio/ D
;D E
private 
readonly 
IDespesaRepositorio ,
_despesaRepositorio- @
;@ A
private 
readonly 
IGanhosRepositorio +
_ganhosRepositorio, >
;> ?
private 
readonly 
IReservaRepositorio ,
_reservaRepositorio- @
;@ A
public  
CategoriasController #
(# $!
ICategoriaRepositorio$ 9 
categoriaRepositorio: N
,N O
IDespesaRepositorio 
despesaRepositorio  2
,2 3
IGanhosRepositorio 
ganhosRepositorio 0
,0 1
IReservaRepositorio 
reservaRepositorio  2
)2 3
{ 	!
_categoriaRepositorio !
=" # 
categoriaRepositorio$ 8
;8 9
_despesaRepositorio 
=  !
despesaRepositorio" 4
;4 5
_ganhosRepositorio 
=  
ganhosRepositorio! 2
;2 3
_reservaRepositorio 
=  !
reservaRepositorio" 4
;4 5
} 	
[ 	
HttpGet	 
] 
[   	
	Authorize  	 
(   
Roles   
=   
$str   *
)  * +
]  + ,
public!! 
async!! 
Task!! 
<!! 
ActionResult!! &
<!!& '
IEnumerable!!' 2
<!!2 3
	Categoria!!3 <
>!!< =
>!!= >
>!!> ?
GetCategorias!!@ M
(!!M N
)!!N O
{"" 	
return## 
await## !
_categoriaRepositorio## .
.##. /

ObterTodos##/ 9
(##9 :
)##: ;
.##; <
ToListAsync##< G
(##G H
)##H I
;##I J
}$$ 	
[&& 	
HttpGet&&	 
(&& 
$str&& 
)&& 
]&& 
['' 	
	Authorize''	 
('' 
Roles'' 
='' 
$str'' *
)''* +
]''+ ,
public(( 
async(( 
Task(( 
<(( 
ActionResult(( &
<((& '
	Categoria((' 0
>((0 1
>((1 2
GetCategoria((3 ?
(((? @
int((@ C
id((D F
)((F G
{)) 	
var** 
	categoria** 
=** 
await** !!
_categoriaRepositorio**" 7
.**7 8
ObterPeloId**8 C
(**C D
id**D F
)**F G
;**G H
if,, 
(,, 
	categoria,, 
==,, 
null,, !
),,! "
{-- 
return.. 
NotFound.. 
(..  
)..  !
;..! "
}// 
return11 
	categoria11 
;11 
}22 	
[44 	
HttpPost44	 
]44 
[55 	
	Authorize55	 
(55 
Roles55 
=55 
$str55 *
)55* +
]55+ ,
public66 
async66 
Task66 
<66 
ActionResult66 &
<66& '
	Categoria66' 0
>660 1
>661 2
PostCategoria663 @
(66@ A
	Categoria66A J
	categoria66K T
)66T U
{77 	
if88 
(88 

ModelState88 
.88 
IsValid88 "
)88" #
{99 
await:: !
_categoriaRepositorio:: +
.::+ ,
Inserir::, 3
(::3 4
	categoria::4 =
)::= >
;::> ?
return;; 
Ok;; 
(;; 
new;; 
{<< 
mensagem== 
=== 
$"== !
$str==! +
{==+ ,
	categoria==- 6
.==6 7
Nome==7 ;
}==< =
$str=== S
"==S T
}>> 
)>> 
;>> 
}?? 
returnAA 

BadRequestAA 
(AA 

ModelStateAA (
)AA( )
;AA) *
}BB 	
[EE 	
HttpPutEE	 
(EE 
$strEE 
)EE 
]EE 
[FF 	
	AuthorizeFF	 
(FF 
RolesFF 
=FF 
$strFF *
)FF* +
]FF+ ,
publicGG 
asyncGG 
TaskGG 
<GG 
IActionResultGG '
>GG' (
PutCategoriaGG) 5
(GG5 6
intGG6 9
idGG: <
,GG< =
	CategoriaGG> G
	categoriaGGH Q
)GGQ R
{HH 	
ifII 
(II 
idII 
!=II 
	categoriaII 
.II  
CategoriaIdII  +
)II+ ,
{JJ 
returnKK 

BadRequestKK !
(KK! "
)KK" #
;KK# $
}LL 
ifNN 
(NN 

ModelStateNN 
.NN 
IsValidNN "
)NN" #
{OO 
awaitPP !
_categoriaRepositorioPP +
.PP+ ,
	AtualizarPP, 5
(PP5 6
	categoriaPP6 ?
)PP? @
;PP@ A
returnQQ 
OkQQ 
(QQ 
newQQ 
{RR 
mensagemSS 
=SS 
$"SS !
$strSS! +
{SS+ ,
	categoriaSS- 6
.SS6 7
NomeSS7 ;
}SS< =
$strSS= U
"SSU V
}TT 
)TT 
;TT 
}UU 
returnWW 

BadRequestWW 
(WW 

ModelStateWW (
)WW( )
;WW) *
}XX 	
[[[ 	

HttpDelete[[	 
([[ 
$str[[ 
)[[ 
][[ 
[\\ 	
	Authorize\\	 
(\\ 
Roles\\ 
=\\ 
$str\\ *
)\\* +
]\\+ ,
public]] 
async]] 
Task]] 
<]] 
ActionResult]] &
<]]& '
	Categoria]]' 0
>]]0 1
>]]1 2
DeleteCategoria]]3 B
(]]B C
int]]C F
id]]G I
)]]I J
{^^ 	
var__ 
	categoria__ 
=__ 
await__ !!
_categoriaRepositorio__" 7
.__7 8
ObterPeloId__8 C
(__C D
id__D F
)__F G
;__G H
if`` 
(`` 
	categoria`` 
==`` 
null``  
)``  !
{aa 
returnbb 
NotFoundbb 
(bb  
)bb  !
;bb! "
}cc 
varee 
despesaee 
=ee 
_despesaRepositorioee -
.ee- .
FiltrarDespesasee. =
(ee= >
	categoriaee> G
.eeG H
NomeeeH L
)eeL M
;eeM N
varff 
ganhoff 
=ff 
_ganhosRepositorioff *
.ff* +
FiltrarGanhosff+ 8
(ff8 9
	categoriaff9 B
.ffB C
NomeffC G
)ffG H
;ffH I
vargg 
reservagg 
=gg 
_reservaRepositoriogg -
.gg- .
FiltrarReservasgg. =
(gg= >
	categoriagg> G
.ggG H
NomeggH L
)ggL M
;ggM N
ifii 
(ii 
despesaii 
!=ii 
nullii 
||ii  "
ganhoii# (
!=ii) +
nullii- 1
||ii2 4
reservaii5 <
!=ii= ?
nullii@ D
)iiD E
{jj 
returnkk 
Okkk 
(kk 
newll 
{mm 
Mensagemnn  
=nn! "
$"nn# %
$strnn% 1
{nn1 2
	categoriann3 <
.nn< =
Nomenn= A
}nnB C
$strnnC w
"nnw x
,nnx y
Errooo 
=oo 
trueoo #
}pp 
)pp 
;pp 
}qq 
awaitss !
_categoriaRepositorioss '
.ss' (
Excluirss( /
(ss/ 0
idss0 2
)ss2 3
;ss3 4
returnuu 
Okuu 
(uu 
newuu 
{vv 
mensagemww 
=ww 
$"ww 
$strww '
{ww' (
	categoriaww) 2
.ww2 3
Nomeww3 7
}ww8 9
$strww9 O
"wwO P
}xx 
)xx 
;xx 
}yy 	
[{{ 	
HttpGet{{	 
({{ 
$str{{ 4
){{4 5
]{{5 6
[|| 	
	Authorize||	 
(|| 
Roles|| 
=|| 
$str|| *
)||* +
]||+ ,
public}} 
async}} 
Task}} 
<}} 
ActionResult}} &
<}}& '
IEnumerable}}' 2
<}}2 3
	Categoria}}3 <
>}}< =
>}}= >
>}}> ?
FiltrarCategorias}}@ Q
(}}Q R
string}}R X
nomeCategoria}}Y f
)}}f g
{~~ 	
return 
await !
_categoriaRepositorio .
.. /
FiltrarCategorias/ @
(@ A
nomeCategoriaA N
)N O
.O P
ToListAsyncP [
([ \
)\ ]
;] ^
}
ÄÄ 	
[
ÇÇ 	
HttpGet
ÇÇ	 
(
ÇÇ 
$str
ÇÇ ,
)
ÇÇ, -
]
ÇÇ- .
[
ÉÉ 	
	Authorize
ÉÉ	 
]
ÉÉ 
public
ÑÑ 
async
ÑÑ 
Task
ÑÑ 
<
ÑÑ 
ActionResult
ÑÑ &
<
ÑÑ& '
IEnumerable
ÑÑ' 2
<
ÑÑ2 3
	Categoria
ÑÑ3 <
>
ÑÑ< =
>
ÑÑ= >
>
ÑÑ> ?'
FiltrarCategoriasDespesas
ÑÑ@ Y
(
ÑÑY Z
)
ÑÑZ [
{
ÖÖ 	
return
ÜÜ 
await
ÜÜ #
_categoriaRepositorio
ÜÜ .
.
ÜÜ. /%
ObterCategoriasPeloTipo
ÜÜ/ F
(
ÜÜF G
$str
ÜÜG P
)
ÜÜP Q
.
ÜÜQ R
ToListAsync
ÜÜR ]
(
ÜÜ] ^
)
ÜÜ^ _
;
ÜÜ_ `
}
áá 	
[
ââ 	
	Authorize
ââ	 
]
ââ 
[
ää 	
HttpGet
ää	 
(
ää 
$str
ää *
)
ää* +
]
ää+ ,
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
ActionResult
ãã &
<
ãã& '
IEnumerable
ãã' 2
<
ãã2 3
	Categoria
ãã3 <
>
ãã< =
>
ãã= >
>
ãã> ?%
FiltrarCategoriasGanhos
ãã@ W
(
ããW X
)
ããX Y
{
åå 	
return
çç 
await
çç #
_categoriaRepositorio
çç .
.
çç. /%
ObterCategoriasPeloTipo
çç/ F
(
ççF G
$str
ççG N
)
ççN O
.
ççO P
ToListAsync
ççP [
(
çç[ \
)
çç\ ]
;
çç] ^
}
éé 	
[
êê 	
	Authorize
êê	 
]
êê 
[
ëë 	
HttpGet
ëë	 
(
ëë 
$str
ëë ,
)
ëë, -
]
ëë- .
public
íí 
async
íí 
Task
íí 
<
íí 
ActionResult
íí &
<
íí& '
IEnumerable
íí' 2
<
íí2 3
	Categoria
íí3 <
>
íí< =
>
íí= >
>
íí> ?'
FiltrarCategoriasReservas
íí@ Y
(
ííY Z
)
ííZ [
{
ìì 	
return
îî 
await
îî #
_categoriaRepositorio
îî .
.
îî. /%
ObterCategoriasPeloTipo
îî/ F
(
îîF G
$str
îîG P
)
îîP Q
.
îîQ R
ToListAsync
îîR ]
(
îî] ^
)
îî^ _
;
îî_ `
}
ïï 	
}
ññ 
}óó £/
VC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\DashboardController.cs
	namespace 	
MyWallet
 
. 
API 
. 
Controllers "
{		 
[

 
	Authorize

 
]

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
DashboardController $
:% &
ControllerBase' 5
{ 
private 
readonly 
ICartaoRepositorio +
_cartaoRepositorio, >
;> ?
private 
readonly 
IGanhosRepositorio +
_ganhosRepositorio, >
;> ?
private 
readonly 
IDespesaRepositorio ,
_despesaRepositorio- @
;@ A
private 
readonly 
IReservaRepositorio ,
_reservaRepositorio- @
;@ A
private 
readonly 
IMesRepositorio (
_mesRepositorio) 8
;8 9
private 
readonly 
IGraficoRepositorio ,
_graficoRepositorio- @
;@ A
public 
DashboardController "
(" #
ICartaoRepositorio# 5
cartaoRepositorio6 G
,G H
IReservaRepositorio 
reservaRepositorio  2
,2 3
IGanhosRepositorio 
ganhosRepositorio 0
,0 1
IDespesaRepositorio 
despesaRepositorio  2
,2 3
IMesRepositorio 
mesRepositorio *
,* +
IGraficoRepositorio 
graficoRepositorio  2
)2 3
{ 	
_cartaoRepositorio 
=  
cartaoRepositorio! 2
;2 3
_ganhosRepositorio 
=  
ganhosRepositorio! 2
;2 3
_reservaRepositorio 
=  !
reservaRepositorio" 4
;4 5
_despesaRepositorio   
=    !
despesaRepositorio  " 4
;  4 5
_mesRepositorio!! 
=!! 
mesRepositorio!! ,
;!!, -
_graficoRepositorio"" 
=""  !
graficoRepositorio""" 4
;""4 5
}## 	
[%% 	
HttpGet%%	 
(%% 
$str%% 7
)%%7 8
]%%8 9
public&& 
async&& 
Task&& 
<&& 
ActionResult&& &
<&&& '(
DadosCardsDashboardViewModel&&' C
>&&C D
>&&D E$
ObterDadosCardsDashboard&&F ^
(&&^ _
string&&_ e
	usuarioId&&f o
)&&o p
{'' 	
int(( 

qtdCartoes(( 
=(( 
await(( "
_cartaoRepositorio((# 5
.((5 6/
#ObterQuantidadeCartoesPeloUsuarioId((6 Y
(((Y Z
	usuarioId((Z c
)((c d
;((d e
double)) 
reservaTotal)) 
=))  !
Math))" &
.))& '
Round))' ,
()), -
await))- 2
_reservaRepositorio))3 F
.))F G)
ObterReservaTotalPorUsuarioId))G d
())d e
	usuarioId))e n
)))n o
,))o p
$num))q r
)))r s
;))s t
double** 

ganhoTotal** 
=** 
Math**  $
.**$ %
Round**% *
(*** +
await**+ 0
_ganhosRepositorio**1 C
.**C D(
ObterGanhoTotalPeloUsuarioId**D `
(**` a
	usuarioId**a j
)**j k
,**k l
$num**m n
)**n o
;**o p
double++ 
despesaTotal++ 
=++  !
Math++" &
.++& '
Round++' ,
(++, -
await++- 2
_despesaRepositorio++3 F
.++F G)
ObterDespesaTotalPorUsuarioId++G d
(++d e
	usuarioId++e n
)++n o
,++o p
$num++q r
)++r s
;++s t
double,, 
saldo,, 
=,, 
Math,, 
.,,  
Round,,  %
(,,% &

ganhoTotal,,& 0
-,,1 2
despesaTotal,,3 ?
,,,? @
$num,,A B
),,B C
;,,C D(
DadosCardsDashboardViewModel.. (
model..) .
=../ 0
new..1 4(
DadosCardsDashboardViewModel..5 Q
{// 

QtdCartoes00 
=00 

qtdCartoes00 '
,00' (

GanhoTotal11 
=11 

ganhoTotal11 '
,11' (
DespesaTotal22 
=22 
despesaTotal22 +
,22+ ,
ReservaTotal33 
=33 
reservaTotal33 +
,33+ ,
Saldo44 
=44 
saldo44 
}55 
;55 
return77 
model77 
;77 
}88 	
[:: 	
HttpGet::	 
(:: 
$str:: B
)::B C
]::C D
public;; 
object;; )
ObterDadosAnuaisPeloUsuarioId;; 3
(;;3 4
string;;4 :
	usuarioId;;; D
,;;D E
int;;F I
ano;;J M
);;M N
{<< 	
return== 
(== 
new== 
{>> 
ganhos?? 
=?? 
_graficoRepositorio?? ,
.??, -*
ObterGanhosAnuaisPeloUsuarioId??- K
(??K L
	usuarioId??L U
,??U V
ano??W Z
)??Z [
,??[ \
despesas@@ 
=@@ 
_graficoRepositorio@@ .
.@@. /,
 ObterDespesasAnuaisPeloUsuarioId@@/ O
(@@O P
	usuarioId@@P Y
,@@Y Z
ano@@[ ^
)@@^ _
,@@_ `
mesesAA 
=AA 
_mesRepositorioAA '
.AA' (

ObterTodosAA( 2
(AA2 3
)AA3 4
}BB 
)BB 
;BB 
}CC 	
}DD 
}EE ”5
UC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\DespesasController.cs
	namespace		 	
MyWallet		
 
.		 
API		 
.		 
Controllers		 "
{

 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
DespesasController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IDespesaRepositorio ,
_despesaRepositorio- @
;@ A
public 
DespesasController !
(! "
IDespesaRepositorio" 5
despesaRepositorio6 H
)H I
{ 	
_despesaRepositorio 
=  !
despesaRepositorio" 4
;4 5
} 	
[ 	
HttpGet	 
( 
$str 9
)9 :
]: ;
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
Despesa3 :
>: ;
>; <
>< =&
ObterDespesasPeloUsuarioId> X
(X Y
stringY _
	usuarioId` i
)i j
{ 	
return 
await 
_despesaRepositorio ,
., -&
ObterDespesasPeloUsuarioId- G
(G H
	usuarioIdH Q
)Q R
.R S
ToListAsyncS ^
(^ _
)_ `
;` a
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
Despesa' .
>. /
>/ 0

GetDespesa1 ;
(; <
int< ?
id@ B
)B C
{   	
Despesa!! 
despesa!! 
=!! 
await!! #
_despesaRepositorio!!$ 7
.!!7 8
ObterPeloId!!8 C
(!!C D
id!!D F
)!!F G
;!!G H
if## 
(## 
despesa## 
==## 
null## 
)##  
return$$ 
NotFound$$ 
($$  
)$$  !
;$$! "
return&& 
despesa&& 
;&& 
}'' 	
[** 	
HttpPost**	 
]** 
public++ 
async++ 
Task++ 
<++ 
ActionResult++ &
<++& '
Despesa++' .
>++. /
>++/ 0
PostDespesa++1 <
(++< =
Despesa++= D
despesa++E L
)++L M
{,, 	
if-- 
(-- 

ModelState-- 
.-- 
IsValid-- "
)--" #
{.. 
await// 
_despesaRepositorio// )
.//) *
Inserir//* 1
(//1 2
despesa//2 9
)//9 :
;//: ;
return11 
Ok11 
(11 
new11 
{22 
mensagem33 
=33 
$"33 !
$str33! 8
{338 9
despesa339 @
.33@ A
Valor33A F
}33F G
$str33G Z
"33Z [
}44 
)44 
;44 
}55 
return77 

BadRequest77 
(77 
despesa77 %
)77% &
;77& '
}88 	
[:: 	
HttpPut::	 
(:: 
$str:: 
):: 
]:: 
public;; 
async;; 
Task;; 
<;; 
ActionResult;; &
<;;& '
Despesa;;' .
>;;. /
>;;/ 0

PutDespesa;;1 ;
(;;; <
int;;< ?
id;;@ B
,;;B C
Despesa;;D K
despesa;;L S
);;S T
{<< 	
if== 
(== 
id== 
!=== 
despesa== 
.== 
	DespesaId== '
)==' (
return>> 

BadRequest>> !
(>>! "
)>>" #
;>># $
if@@ 
(@@ 

ModelState@@ 
.@@ 
IsValid@@ "
)@@" #
{AA 
awaitBB 
_despesaRepositorioBB )
.BB) *
	AtualizarBB* 3
(BB3 4
despesaBB4 ;
)BB; <
;BB< =
returnDD 
OkDD 
(DD 
newDD 
{EE 
mensagemFF 
=FF 
$"FF !
$strFF! 8
{FF8 9
despesaFF9 @
.FF@ A
ValorFFA F
}FFF G
$strFFG ^
"FF^ _
}GG 
)GG 
;GG 
}HH 
returnJJ 

BadRequestJJ 
(JJ 
despesaJJ %
)JJ% &
;JJ& '
}KK 	
[MM 	

HttpDeleteMM	 
(MM 
$strMM 
)MM 
]MM 
publicNN 
asyncNN 
TaskNN 
<NN 
ActionResultNN &
>NN& '
DeleteDespesaNN( 5
(NN5 6
intNN6 9
idNN: <
)NN< =
{OO 	
DespesaPP 
despesaPP 
=PP 
awaitPP #
_despesaRepositorioPP$ 7
.PP7 8
ObterPeloIdPP8 C
(PPC D
idPPD F
)PPF G
;PPG H
ifRR 
(RR 
despesaRR 
==RR 
nullRR 
)RR  
{SS 
returnTT 
NotFoundTT 
(TT  
)TT  !
;TT! "
}UU 
awaitWW 
_despesaRepositorioWW %
.WW% &
ExcluirWW& -
(WW- .
despesaWW. 5
)WW5 6
;WW6 7
returnYY 
OkYY 
(YY 
newYY 
{ZZ 
mensagem[[ 
=[[ 
$"[[ 
$str[[ 4
{[[4 5
despesa[[5 <
.[[< =
Valor[[= B
}[[B C
$str[[C X
"[[X Y
}\\ 
)\\ 
;\\ 
}]] 	
[__ 	
HttpGet__	 
(__ 
$str__ 2
)__2 3
]__3 4
public`` 
async`` 
Task`` 
<`` 
IEnumerable`` %
<``% &
Despesa``& -
>``- .
>``. /
FiltrarDespesas``0 ?
(``? @
string``@ F
nomeCategoria``G T
)``T U
{aa 	
returnbb 
awaitbb 
_despesaRepositoriobb ,
.bb, -
FiltrarDespesasbb- <
(bb< =
nomeCategoriabb= J
)bbJ K
.bbK L
ToListAsyncbbL W
(bbW X
)bbX Y
;bbY Z
}cc 	
}dd 
}ee ˚;
TC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\FuncoesController.cs
	namespace

 	
MyWallet


 
.

 
API

 
.

 
Controllers

 "
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
( 
Roles 
= 
$str &
)& '
]' (
public 

class 
FuncoesController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IFuncaoRepositorio +
_funcaoRepositorio, >
;> ?
public 
FuncoesController  
(  !
IFuncaoRepositorio! 3
funcaoRepositorio4 E
)E F
{ 	
_funcaoRepositorio 
=  
funcaoRepositorio! 2
;2 3
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
Funcao3 9
>9 :
>: ;
>; <

GetFuncoes= G
(G H
)H I
{ 	
return 
await 
_funcaoRepositorio +
.+ ,

ObterTodos, 6
(6 7
)7 8
.8 9
ToListAsync9 D
(D E
)E F
;F G
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
Funcao' -
>- .
>. /
	GetFuncao0 9
(9 :
string: @
idA C
)C D
{ 	
var   
funcao   
=   
await   
_funcaoRepositorio   1
.  1 2
ObterPeloId  2 =
(  = >
id  > @
)  @ A
;  A B
if"" 
("" 
funcao"" 
=="" 
null"" 
)"" 
{## 
return$$ 
NotFound$$ 
($$  
)$$  !
;$$! "
}%% 
return'' 
funcao'' 
;'' 
}(( 	
[** 	
HttpPut**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
	PutFuncao++) 2
(++2 3
string++3 9
id++: <
,++< =
FuncoesViewModel++> N
funcoes++O V
)++V W
{,, 	
if-- 
(-- 
id-- 
!=-- 
funcoes-- 
.-- 
Id--  
)--  !
{.. 
return// 

BadRequest// !
(//! "
)//" #
;//# $
}00 
if22 
(22 

ModelState22 
.22 
IsValid22 "
)22" #
{33 
Funcao44 
funcao44 
=44 
new44  #
Funcao44$ *
{55 
Id66 
=66 
funcoes66  
.66  !
Id66! #
,66# $
Name77 
=77 
funcoes77 "
.77" #
Name77# '
,77' (
	Descricao88 
=88 
funcoes88  '
.88' (
	Descricao88( 1
}99 
;99 
await;; 
_funcaoRepositorio;; (
.;;( )
AtualizarFuncao;;) 8
(;;8 9
funcao;;9 ?
);;? @
;;;@ A
return== 
Ok== 
(== 
new== 
{>> 
mensagem?? 
=?? 
$"?? !
$str??! (
{??( )
funcao??) /
.??/ 0
Name??0 4
}??4 5
$str??5 L
"??L M
}@@ 
)@@ 
;@@ 
}AA 
returnCC 

BadRequestCC 
(CC 

ModelStateCC (
)CC( )
;CC) *
}DD 	
[FF 	
HttpPostFF	 
]FF 
publicGG 
asyncGG 
TaskGG 
<GG 
ActionResultGG &
<GG& '
FuncaoGG' -
>GG- .
>GG. /

PostFuncaoGG0 :
(GG: ;
FuncoesViewModelGG; K
funcoesGGL S
)GGS T
{HH 	
ifII 
(II 

ModelStateII 
.II 
IsValidII "
)II" #
{JJ 
FuncaoKK 
funcaoKK 
=KK 
newKK  #
FuncaoKK$ *
{LL 
NameMM 
=MM 
funcoesMM "
.MM" #
NameMM# '
,MM' (
	DescricaoNN 
=NN 
funcoesNN  '
.NN' (
	DescricaoNN( 1
}OO 
;OO 
awaitQQ 
_funcaoRepositorioQQ (
.QQ( )
AdicionarFuncaoQQ) 8
(QQ8 9
funcaoQQ9 ?
)QQ? @
;QQ@ A
returnSS 
OkSS 
(SS 
newSS 
{TT 
mensagemUU 
=UU 
$"UU !
$strUU! (
{UU( )
funcaoUU) /
.UU/ 0
NameUU0 4
}UU4 5
$strUU5 L
"UUL M
}VV 
)VV 
;VV 
}WW 
returnYY 

BadRequestYY 
(YY 

ModelStateYY (
)YY( )
;YY) *
}ZZ 	
[\\ 	

HttpDelete\\	 
(\\ 
$str\\ 
)\\ 
]\\ 
public]] 
async]] 
Task]] 
<]] 
ActionResult]] &
<]]& '
Funcao]]' -
>]]- .
>]]. /
DeleteFuncao]]0 <
(]]< =
string]]= C
id]]D F
)]]F G
{^^ 	
var__ 
funcao__ 
=__ 
await__ 
_funcaoRepositorio__ 1
.__1 2
ObterPeloId__2 =
(__= >
id__> @
)__@ A
;__A B
if`` 
(`` 
funcao`` 
==`` 
null`` 
)`` 
{aa 
returnbb 
NotFoundbb 
(bb  
)bb  !
;bb! "
}cc 
awaitee 
_funcaoRepositorioee $
.ee$ %
Excluiree% ,
(ee, -
funcaoee- 3
)ee3 4
;ee4 5
returngg 
Okgg 
(gg 
newgg 
{hh 
mensagemii 
=ii 
$"ii 
$strii $
{ii$ %
funcaoii% +
.ii+ ,
Nameii, 0
}ii0 1
$strii1 F
"iiF G
}jj 
)jj 
;jj 
}kk 	
[mm 	
HttpGetmm	 
(mm 
$strmm .
)mm. /
]mm/ 0
publicnn 
asyncnn 
Tasknn 
<nn 
ActionResultnn &
<nn& '
IEnumerablenn' 2
<nn2 3
Funcaonn3 9
>nn9 :
>nn: ;
>nn; <
FiltrarFuncoesnn= K
(nnK L
stringnnL R

nomeFuncaonnS ]
)nn] ^
{oo 	
returnpp 
awaitpp 
_funcaoRepositoriopp +
.pp+ ,
FiltrarFuncoespp, :
(pp: ;

nomeFuncaopp; E
)ppE F
.ppF G
ToListAsyncppG R
(ppR S
)ppS T
;ppT U
}qq 	
}rr 
}ss …4
SC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\GanhosController.cs
	namespace		 	
MyWallet		
 
.		 
API		 
.		 
Controllers		 "
{

 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
GanhosController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IGanhosRepositorio +
_ganhosRepositorio, >
;> ?
public 
GanhosController 
(  
IGanhosRepositorio  2
ganhosRepositorio3 D
)D E
{ 	
_ganhosRepositorio 
=  
ganhosRepositorio! 2
;2 3
} 	
[ 	
HttpGet	 
( 
$str 7
)7 8
]8 9
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
Ganho3 8
>8 9
>9 :
>: ;$
ObterGanhosPeloUsuarioId< T
(T U
stringU [
	usuarioId\ e
)e f
{ 	
return 
await 
_ganhosRepositorio +
.+ ,$
ObterGanhosPeloUsuarioId, D
(D E
	usuarioIdE N
)N O
.O P
ToListAsyncP [
([ \
)\ ]
;] ^
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
Ganho' ,
>, -
>- .
GetGanho/ 7
(7 8
int8 ;
ganhoId< C
)C D
{ 	
Ganho   
ganho   
=   
await   
_ganhosRepositorio    2
.  2 3
ObterPeloId  3 >
(  > ?
ganhoId  ? F
)  F G
;  G H
if"" 
("" 
ganho"" 
=="" 
null"" 
)"" 
return## 
NotFound## 
(##  
)##  !
;##! "
return%% 
ganho%% 
;%% 
}&& 	
[(( 	
HttpPut((	 
((( 
$str(( 
)(( 
](( 
public)) 
async)) 
Task)) 
<)) 
ActionResult)) &
>))& '
PutGanho))( 0
())0 1
int))1 4
ganhoId))5 <
,))< =
Ganho))> C
ganho))D I
)))I J
{** 	
if++ 
(++ 
ganhoId++ 
!=++ 
ganho++  
.++  !
GanhoId++! (
)++( )
return,, 
NotFound,, 
(,,  
),,  !
;,,! "
if.. 
(.. 

ModelState.. 
... 
IsValid.. "
).." #
{// 
await00 
_ganhosRepositorio00 (
.00( )
	Atualizar00) 2
(002 3
ganho003 8
)008 9
;009 :
return22 
Ok22 
(22 
new22 
{33 
mensagem44 
=44 
$"44 !
$str44! 6
{446 7
ganho447 <
.44< =
Valor44= B
}44B C
$str44C Z
"44Z [
}55 
)55 
;55 
}66 
return88 

BadRequest88 
(88 
ganho88 #
)88# $
;88$ %
}99 	
[;; 	
HttpPost;;	 
];; 
public<< 
async<< 
Task<< 
<<< 
ActionResult<< &
<<<& '
Ganho<<' ,
><<, -
><<- .
	PostGanho<</ 8
(<<8 9
Ganho<<9 >
ganho<<? D
)<<D E
{== 	
if>> 
(>> 

ModelState>> 
.>> 
IsValid>> "
)>>" #
{?? 
await@@ 
_ganhosRepositorio@@ (
.@@( )
Inserir@@) 0
(@@0 1
ganho@@1 6
)@@6 7
;@@7 8
returnBB 
OkBB 
(BB 
newBB 
{CC 
mensagemDD 
=DD 
$"DD !
$strDD! 6
{DD6 7
ganhoDD7 <
.DD< =
ValorDD= B
}DDB C
$strDDC X
"DDX Y
}EE 
)EE 
;EE 
}FF 
returnHH 

BadRequestHH 
(HH 
ganhoHH #
)HH# $
;HH$ %
}II 	
[KK 	

HttpDeleteKK	 
(KK 
$strKK 
)KK  
]KK  !
publicLL 
asyncLL 
TaskLL 
<LL 
ActionResultLL &
>LL& '
DeleteGanhoLL( 3
(LL3 4
intLL4 7
ganhoIdLL8 ?
)LL? @
{MM 	
GanhoNN 
ganhoNN 
=NN 
awaitNN 
_ganhosRepositorioNN  2
.NN2 3
ObterPeloIdNN3 >
(NN> ?
ganhoIdNN? F
)NNF G
;NNG H
ifPP 
(PP 
ganhoPP 
==PP 
nullPP 
)PP 
returnQQ 
NotFoundQQ 
(QQ  
)QQ  !
;QQ! "
awaitSS 
_ganhosRepositorioSS $
.SS$ %
ExcluirSS% ,
(SS, -
ganhoSS- 2
)SS2 3
;SS3 4
returnUU 
OkUU 
(UU 
newUU 
{VV 
mensagemWW 
=WW 
$"WW 
$strWW 2
{WW2 3
ganhoWW3 8
.WW8 9
ValorWW9 >
}WW> ?
$strWW? T
"WWT U
}XX 
)XX 
;XX 
}YY 	
[[[ 	
HttpGet[[	 
([[ 
$str[[ 0
)[[0 1
][[1 2
public\\ 
async\\ 
Task\\ 
<\\ 
IEnumerable\\ %
<\\% &
Ganho\\& +
>\\+ ,
>\\, -
FiltrarGanhos\\. ;
(\\; <
string\\< B
nomeCategoria\\C P
)\\P Q
{]] 	
return^^ 
await^^ 
_ganhosRepositorio^^ +
.^^+ ,
FiltrarGanhos^^, 9
(^^9 :
nomeCategoria^^: G
)^^G H
.^^H I
ToListAsync^^I T
(^^T U
)^^U V
;^^V W
}__ 	
}`` 
}aa ≥
RC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\MesesController.cs
	namespace 	
MyWallet
 
. 
API 
. 
Controllers "
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
MesesController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IMesRepositorio (
_mesRepositorio) 8
;8 9
public 
MesesController 
( 
IMesRepositorio .
mesRepositorio/ =
)= >
{ 	
_mesRepositorio 
= 
mesRepositorio ,
;, -
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
Mes3 6
>6 7
>7 8
>8 9
GetMeses: B
(B C
)C D
{ 	
return 
await 
_mesRepositorio (
.( )

ObterTodos) 3
(3 4
)4 5
.5 6
ToListAsync6 A
(A B
)B C
;C D
} 	
} 
} ˙9
RC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\MetasController.cs
	namespace		 	
MyWallet		
 
.		 
API		 
.		 
Controllers		 "
{

 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
MetasController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IMetaRepositorio )
_metaRepositorio* :
;: ;
public 
MetasController 
( 
IMetaRepositorio /
metaRepositorio0 ?
)? @
{ 	
_metaRepositorio 
= 
metaRepositorio .
;. /
} 	
[ 	
HttpGet	 
( 
$str 6
)6 7
]7 8
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
Meta3 7
>7 8
>8 9
>9 :#
ObterMetasPeloUsuarioId; R
(R S
stringS Y
	usuarioIdZ c
)c d
{ 	
return 
await 
_metaRepositorio )
.) *#
ObterMetasPeloUsuarioId* A
(A B
	usuarioIdB K
)K L
.L M
ToListAsyncM X
(X Y
)Y Z
;Z [
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
Meta3 7
>7 8
>8 9
>9 :
GetMetas; C
(C D
)D E
{ 	
return 
await 
_metaRepositorio )
.) *

ObterTodos* 4
(4 5
)5 6
.6 7
ToListAsync7 B
(B C
)C D
;D E
}   	
["" 	
HttpGet""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
Meta##' +
>##+ ,
>##, -
GetMeta##. 5
(##5 6
int##6 9
id##: <
)##< =
{$$ 	
var%% 
meta%% 
=%% 
await%% 
_metaRepositorio%% -
.%%- .
ObterPeloId%%. 9
(%%9 :
id%%: <
)%%< =
;%%= >
if'' 
('' 
meta'' 
=='' 
null'' 
)'' 
{(( 
return)) 
NotFound)) 
())  
)))  !
;))! "
}** 
return,, 
meta,, 
;,, 
}-- 	
[// 	
HttpPost//	 
]// 
public00 
async00 
Task00 
<00 
ActionResult00 &
<00& '
Meta00' +
>00+ ,
>00, -
PostMeta00. 6
(006 7
Meta007 ;
meta00< @
)00@ A
{11 	
if22 
(22 

ModelState22 
.22 
IsValid22 "
)22" #
{33 
await44 
_metaRepositorio44 &
.44& '
Inserir44' .
(44. /
meta44/ 3
)443 4
;444 5
return55 
Ok55 
(55 
new55 
{66 
mensagem77 
=77 
$"77 !
$str77! &
{77& '
meta77( ,
.77, -
	Descricao77- 6
}777 8
$str778 N
"77N O
}88 
)88 
;88 
}99 
return;; 

BadRequest;; 
(;; 

ModelState;; (
);;( )
;;;) *
}<< 	
[?? 	
HttpPut??	 
(?? 
$str?? 
)?? 
]?? 
public@@ 
async@@ 
Task@@ 
<@@ 
IActionResult@@ '
>@@' (
PutMeta@@) 0
(@@0 1
int@@1 4
id@@5 7
,@@7 8
Meta@@9 =
meta@@> B
)@@B C
{AA 	
ifBB 
(BB 
idBB 
!=BB 
metaBB 
.BB 
IdMetaBB !
)BB! "
{CC 
returnDD 

BadRequestDD !
(DD! "
)DD" #
;DD# $
}EE 
ifGG 
(GG 

ModelStateGG 
.GG 
IsValidGG "
)GG" #
{HH 
awaitII 
_metaRepositorioII &
.II& '
	AtualizarII' 0
(II0 1
metaII1 5
)II5 6
;II6 7
returnJJ 
OkJJ 
(JJ 
newJJ 
{KK 
mensagemLL 
=LL 
$"LL !
$strLL! &
{LL& '
metaLL( ,
.LL, -
	DescricaoLL- 6
}LL7 8
$strLL8 P
"LLP Q
}MM 
)MM 
;MM 
}NN 
returnPP 

BadRequestPP 
(PP 

ModelStatePP (
)PP( )
;PP) *
}QQ 	
[TT 	

HttpDeleteTT	 
(TT 
$strTT 
)TT 
]TT 
publicUU 
asyncUU 
TaskUU 
<UU 
ActionResultUU &
<UU& '
MetaUU' +
>UU+ ,
>UU, -

DeleteMetaUU. 8
(UU8 9
intUU9 <
idUU= ?
)UU? @
{VV 	
varWW 
metaWW 
=WW 
awaitWW 
_metaRepositorioWW -
.WW- .
ObterPeloIdWW. 9
(WW9 :
idWW: <
)WW< =
;WW= >
ifXX 
(XX 
metaXX 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
NotFoundZZ 
(ZZ  
)ZZ  !
;ZZ! "
}[[ 
await]] 
_metaRepositorio]] "
.]]" #
Excluir]]# *
(]]* +
id]]+ -
)]]- .
;]]. /
return__ 
Ok__ 
(__ 
new__ 
{`` 
mensagemaa 
=aa 
$"aa 
$straa "
{aa" #
metaaa$ (
.aa( )
	Descricaoaa) 2
}aa3 4
$straa4 J
"aaJ K
}bb 
)bb 
;bb 
}cc 	
[ee 	
HttpGetee	 
(ee 
$stree +
)ee+ ,
]ee, -
publicff 
asyncff 
Taskff 
<ff 
ActionResultff &
<ff& '
IEnumerableff' 2
<ff2 3
Metaff3 7
>ff7 8
>ff8 9
>ff9 :
FiltrarMetasff; G
(ffG H
stringffH N
	descricaoffO X
)ffX Y
{gg 	
returnhh 
awaithh 
_metaRepositoriohh )
.hh) *
FiltrarMetashh* 6
(hh6 7
	descricaohh7 @
)hh@ A
.hhA B
ToListAsynchhB M
(hhM N
)hhN O
;hhO P
}ii 	
}ll 
}mm ”5
UC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\ReservasController.cs
	namespace		 	
MyWallet		
 
.		 
API		 
.		 
Controllers		 "
{

 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
ReservasController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IReservaRepositorio ,
_reservaRepositorio- @
;@ A
public 
ReservasController !
(! "
IReservaRepositorio" 5
reservaRepositorio6 H
)H I
{ 	
_reservaRepositorio 
=  !
reservaRepositorio" 4
;4 5
} 	
[ 	
HttpGet	 
( 
$str 9
)9 :
]: ;
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
Reserva3 :
>: ;
>; <
>< =&
ObterReservasPeloUsuarioId> X
(X Y
stringY _
	usuarioId` i
)i j
{ 	
return 
await 
_reservaRepositorio ,
., -&
ObterReservasPeloUsuarioId- G
(G H
	usuarioIdH Q
)Q R
.R S
ToListAsyncS ^
(^ _
)_ `
;` a
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
Reserva' .
>. /
>/ 0

GetReserva1 ;
(; <
int< ?
id@ B
)B C
{   	
Reserva!! 
reserva!! 
=!! 
await!! #
_reservaRepositorio!!$ 7
.!!7 8
ObterPeloId!!8 C
(!!C D
id!!D F
)!!F G
;!!G H
if## 
(## 
reserva## 
==## 
null## 
)##  
return$$ 
NotFound$$ 
($$  
)$$  !
;$$! "
return&& 
reserva&& 
;&& 
}'' 	
[** 	
HttpPost**	 
]** 
public++ 
async++ 
Task++ 
<++ 
ActionResult++ &
<++& '
Reserva++' .
>++. /
>++/ 0
PostReserva++1 <
(++< =
Reserva++= D
reserva++E L
)++L M
{,, 	
if-- 
(-- 

ModelState-- 
.-- 
IsValid-- "
)--" #
{.. 
await// 
_reservaRepositorio// )
.//) *
Inserir//* 1
(//1 2
reserva//2 9
)//9 :
;//: ;
return11 
Ok11 
(11 
new11 
{22 
mensagem33 
=33 
$"33 !
$str33! 8
{338 9
reserva339 @
.33@ A
Valor33A F
}33F G
$str33G ^
"33^ _
}44 
)44 
;44 
}55 
return77 

BadRequest77 
(77 
reserva77 %
)77% &
;77& '
}88 	
[:: 	
HttpPut::	 
(:: 
$str:: 
):: 
]:: 
public;; 
async;; 
Task;; 
<;; 
ActionResult;; &
<;;& '
Reserva;;' .
>;;. /
>;;/ 0

PutReserva;;1 ;
(;;; <
int;;< ?
id;;@ B
,;;B C
Reserva;;D K
reserva;;L S
);;S T
{<< 	
if== 
(== 
id== 
!=== 
reserva== 
.== 
	ReservaId== '
)==' (
return>> 

BadRequest>> !
(>>! "
)>>" #
;>># $
if@@ 
(@@ 

ModelState@@ 
.@@ 
IsValid@@ "
)@@" #
{AA 
awaitBB 
_reservaRepositorioBB )
.BB) *
	AtualizarBB* 3
(BB3 4
reservaBB4 ;
)BB; <
;BB< =
returnDD 
OkDD 
(DD 
newDD 
{EE 
mensagemFF 
=FF 
$"FF !
$strFF! 8
{FF8 9
reservaFF9 @
.FF@ A
ValorFFA F
}FFF G
$strFFG ^
"FF^ _
}GG 
)GG 
;GG 
}HH 
returnJJ 

BadRequestJJ 
(JJ 
reservaJJ %
)JJ% &
;JJ& '
}KK 	
[MM 	

HttpDeleteMM	 
(MM 
$strMM 
)MM 
]MM 
publicNN 
asyncNN 
TaskNN 
<NN 
ActionResultNN &
>NN& '
DeleteReservaNN( 5
(NN5 6
intNN6 9
idNN: <
)NN< =
{OO 	
ReservaPP 
reservaPP 
=PP 
awaitPP #
_reservaRepositorioPP$ 7
.PP7 8
ObterPeloIdPP8 C
(PPC D
idPPD F
)PPF G
;PPG H
ifRR 
(RR 
reservaRR 
==RR 
nullRR 
)RR  
{SS 
returnTT 
NotFoundTT 
(TT  
)TT  !
;TT! "
}UU 
awaitWW 
_reservaRepositorioWW %
.WW% &
ExcluirWW& -
(WW- .
reservaWW. 5
)WW5 6
;WW6 7
returnYY 
OkYY 
(YY 
newYY 
{ZZ 
mensagem[[ 
=[[ 
$"[[ 
$str[[ 4
{[[4 5
reserva[[5 <
.[[< =
Valor[[= B
}[[B C
$str[[C X
"[[X Y
}\\ 
)\\ 
;\\ 
}]] 	
[__ 	
HttpGet__	 
(__ 
$str__ 2
)__2 3
]__3 4
public`` 
async`` 
Task`` 
<`` 
IEnumerable`` %
<``% &
Reserva``& -
>``- .
>``. /
FiltrarReservas``0 ?
(``? @
string``@ F
nomeCategoria``G T
)``T U
{aa 	
returnbb 
awaitbb 
_reservaRepositoriobb ,
.bb, -
FiltrarReservasbb- <
(bb< =
nomeCategoriabb= J
)bbJ K
.bbK L
ToListAsyncbbL W
(bbW X
)bbX Y
;bbY Z
}cc 	
}dd 
}ee öF
^C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\TiposMovimentacaoController.cs
	namespace		 	
MyWallet		
 
.		 
API		 
.		 
Controllers		 "
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class '
TiposMovimentacaoController ,
:- .
ControllerBase/ =
{ 
private 
readonly (
ITipoMovimentacaoRepositorio 5
_tipoRepositorio6 F
;F G
private 
readonly !
ICategoriaRepositorio .!
_categoriaRepositorio/ D
;D E
public '
TiposMovimentacaoController *
(* +(
ITipoMovimentacaoRepositorio+ G
tipoRepositorioH W
,W X!
ICategoriaRepositorioY n!
categoriaRepositorio	o É
)
É Ñ
{ 	
_tipoRepositorio 
= 
tipoRepositorio .
;. /!
_categoriaRepositorio !
=" # 
categoriaRepositorio$ 8
;8 9
} 	
[ 	
HttpGet	 
] 
[ 	
	Authorize	 
( 
Roles 
= 
$str *
)* +
]+ ,
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
TipoMovimentacao3 C
>C D
>D E
>E F 
GetTiposMovimentacaoG [
([ \
)\ ]
{ 	
return 
await 
_tipoRepositorio )
.) *

ObterTodos* 4
(4 5
)5 6
.6 7
ToListAsync7 B
(B C
)C D
;D E
} 	
[   	
HttpGet  	 
(   
$str   
)   
]   
[!! 	
	Authorize!!	 
(!! 
Roles!! 
=!! 
$str!! *
)!!* +
]!!+ ,
public"" 
async"" 
Task"" 
<"" 
ActionResult"" &
<""& '
TipoMovimentacao""' 7
>""7 8
>""8 9
GetTipoMovimentacao"": M
(""M N
int""N Q
id""R T
)""T U
{## 	
var$$ 
tipoMovimentacao$$  
=$$! "
await$$# (
_tipoRepositorio$$) 9
.$$9 :
ObterPeloId$$: E
($$E F
id$$F H
)$$H I
;$$I J
if&& 
(&& 
tipoMovimentacao&&  
==&&! #
null&&$ (
)&&( )
{'' 
return(( 
NotFound(( 
(((  
)((  !
;((! "
})) 
return++ 
tipoMovimentacao++ #
;++# $
},, 	
[.. 	
HttpPost..	 
].. 
[// 	
	Authorize//	 
(// 
Roles// 
=// 
$str// *
)//* +
]//+ ,
public00 
async00 
Task00 
<00 
ActionResult00 &
<00& '
TipoMovimentacao00' 7
>007 8
>008 9 
PostTipoMovimentacao00: N
(00N O
TipoMovimentacao00O _
tipoMovimentacao00` p
)00p q
{11 	
if22 
(22 

ModelState22 
.22 
IsValid22 "
)22" #
{33 
await44 
_tipoRepositorio44 &
.44& '
Inserir44' .
(44. /
tipoMovimentacao44/ ?
)44? @
;44@ A
return55 
Ok55 
(55 
new55 
{66 
mensagem77 
=77 
$"77 !
$str77! 6
{776 7
tipoMovimentacao778 H
.77H I
Nome77I M
}77N O
$str77O e
"77e f
}88 
)88 
;88 
}99 
return;; 

BadRequest;; 
(;; 

ModelState;; (
);;( )
;;;) *
}<< 	
[?? 	
HttpPut??	 
(?? 
$str?? 
)?? 
]?? 
[@@ 	
	Authorize@@	 
(@@ 
Roles@@ 
=@@ 
$str@@ *
)@@* +
]@@+ ,
publicAA 
asyncAA 
TaskAA 
<AA 
IActionResultAA '
>AA' (
PutTipoMovimentacaoAA) <
(AA< =
intAA= @
idAAA C
,AAC D
TipoMovimentacaoAAE U
tipoMovimentacaoAAV f
)AAf g
{BB 	
ifCC 
(CC 
idCC 
!=CC 
tipoMovimentacaoCC &
.CC& '
IdTipoMovimentacaoCC' 9
)CC9 :
{DD 
returnEE 

BadRequestEE !
(EE! "
)EE" #
;EE# $
}FF 
ifHH 
(HH 

ModelStateHH 
.HH 
IsValidHH "
)HH" #
{II 
awaitJJ 
_tipoRepositorioJJ &
.JJ& '
	AtualizarJJ' 0
(JJ0 1
tipoMovimentacaoJJ1 A
)JJA B
;JJB C
returnKK 
OkKK 
(KK 
newKK 
{LL 
mensagemMM 
=MM 
$"MM !
$strMM! 6
{MM6 7
tipoMovimentacaoMM8 H
.MMH I
NomeMMI M
}MMN O
$strMMO g
"MMg h
}NN 
)NN 
;NN 
}OO 
returnQQ 

BadRequestQQ 
(QQ 

ModelStateQQ (
)QQ( )
;QQ) *
}RR 	
[UU 	

HttpDeleteUU	 
(UU 
$strUU 
)UU 
]UU 
[VV 	
	AuthorizeVV	 
(VV 
RolesVV 
=VV 
$strVV *
)VV* +
]VV+ ,
publicWW 
asyncWW 
TaskWW 
<WW 
ActionResultWW &
<WW& '
TipoMovimentacaoWW' 7
>WW7 8
>WW8 9"
DeleteTipoMovimentacaoWW: P
(WWP Q
intWWQ T
idWWU W
)WWW X
{XX 	
varYY 
tipoMovimentacaoYY  
=YY! "
awaitYY# (
_tipoRepositorioYY) 9
.YY9 :
ObterPeloIdYY: E
(YYE F
idYYF H
)YYH I
;YYI J
ifZZ 
(ZZ 
tipoMovimentacaoZZ  
==ZZ! #
nullZZ$ (
)ZZ( )
{[[ 
return\\ 
NotFound\\ 
(\\  
)\\  !
;\\! "
}]] 
var__ 
	categoria__ 
=__ !
_categoriaRepositorio__ 1
.__1 2#
ObterCategoriasPeloTipo__2 I
(__I J
tipoMovimentacao__J Z
.__Z [
Nome__[ _
)___ `
;__` a
if`` 
(`` 
	categoria`` 
!=`` 
null`` !
)``! "
{aa 
returnbb 
Okbb 
(bb 
newcc 
{dd 
Mensagemee  
=ee! "
$"ee# %
$stree% <
{ee< =
tipoMovimentacaoee> N
.eeN O
NomeeeO S
}eeT U
$str	eeU â
"
eeâ ä
,
eeä ã
Erroff 
=ff 
trueff #
}gg 
)gg 
;gg 
}hh 
awaitjj 
_tipoRepositoriojj "
.jj" #
Excluirjj# *
(jj* +
idjj+ -
)jj- .
;jj. /
returnll 
Okll 
(ll 
newll 
{mm 
mensagemnn 
=nn 
$"nn 
$strnn 2
{nn2 3
tipoMovimentacaonn4 D
.nnD E
NomennE I
}nnJ K
$strnnK a
"nna b
}oo 
)oo 
;oo 
}pp 	
[rr 	
HttpGetrr	 
(rr 
$strrr 6
)rr6 7
]rr7 8
[ss 	
	Authorizess	 
(ss 
Rolesss 
=ss 
$strss *
)ss* +
]ss+ ,
publictt 
asynctt 
Tasktt 
<tt 
ActionResulttt &
<tt& '
IEnumerablett' 2
<tt2 3
TipoMovimentacaott3 C
>ttC D
>ttD E
>ttE F$
FiltrarTiposMovimentacaottG _
(tt_ `
stringtt` f
nomeTipottg o
)tto p
{uu 	
returnvv 
awaitvv 
_tipoRepositoriovv )
.vv) *$
FiltrarTiposMovimentacaovv* B
(vvB C
nomeTipovvC K
)vvK L
.vvL M
ToListAsyncvvM X
(vvX Y
)vvY Z
;vvZ [
}ww 	
}yy 
}zz ü
UC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Controllers\UsuariosController.cs
	namespace 	
MyWallet
 
. 
API 
. 
Controllers "
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
UsuariosController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IUsuarioRepositorio ,
_usuarioRepositorio- @
;@ A
public 
UsuariosController !
(! "
IUsuarioRepositorio" 5
usuarioRepositorio6 H
)H I
{ 	
_usuarioRepositorio 
=  !
usuarioRepositorio" 4
;4 5
} 	
[ 	
HttpGet	 
] 
[ 	
	Authorize	 
( 
Roles 
= 
$str *
)* +
]+ ,
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
Usuario3 :
>: ;
>; <
>< =
GetUsuarios> I
(I J
)J K
{ 	
return 
await 
_usuarioRepositorio ,
., -

ObterTodos- 7
(7 8
)8 9
.9 :
ToListAsync: E
(E F
)F G
;G H
} 	
[!! 	
HttpGet!!	 
(!! 
$str!! 
)!! 
]!! 
public"" 
async"" 
Task"" 
<"" 
ActionResult"" &
<""& '%
AtualizarUsuarioViewModel""' @
>""@ A
>""A B

GetUsuario""C M
(""M N
string""N T
id""U W
)""W X
{## 	
var$$ 
usuario$$ 
=$$ 
await$$ 
_usuarioRepositorio$$  3
.$$3 4
ObterPeloId$$4 ?
($$? @
id$$@ B
)$$B C
;$$C D
if&& 
(&& 
usuario&& 
==&& 
null&& 
)&&  
{'' 
return(( 
NotFound(( 
(((  
)((  !
;((! "
})) %
AtualizarUsuarioViewModel++ %
model++& +
=++, -
new++. 1%
AtualizarUsuarioViewModel++2 K
{,, 
Id-- 
=-- 
usuario-- 
.-- 
Id-- 
,--  
UserName.. 
=.. 
usuario.. "
..." #
UserName..# +
,..+ ,
Email// 
=// 
usuario// 
.//  
Email//  %
,//% &
CPF00 
=00 
usuario00 
.00 
CPF00 !
,00! "
	Profissao11 
=11 
usuario11 #
.11# $
	Profissao11$ -
,11- .
Foto22 
=22 
usuario22 
.22 
Foto22 #
}33 
;33 
return55 
model55 
;55 
}66 	
[88 	
HttpPost88	 
(88 
$str88 
)88 
]88  
public99 
async99 
Task99 
<99 
ActionResult99 &
>99& '

SalvarFoto99( 2
(992 3
)993 4
{:: 	
var;; 
foto;; 
=;; 
Request;; 
.;; 
Form;; #
.;;# $
Files;;$ )
[;;) *
$num;;* +
];;+ ,
;;;, -
byte<< 
[<< 
]<< 
b<< 
;<< 
using>> 
(>> 
var>> 
openReadStream>> %
=>>& '
foto>>( ,
.>>, -
OpenReadStream>>- ;
(>>; <
)>>< =
)>>= >
{?? 
using@@ 
(@@ 
var@@ 
memoryStream@@ '
=@@( )
new@@* -
MemoryStream@@. :
(@@: ;
)@@; <
)@@< =
{AA 
awaitBB 
openReadStreamBB (
.BB( )
CopyToAsyncBB) 4
(BB4 5
memoryStreamBB5 A
)BBA B
;BBB C
bCC 
=CC 
memoryStreamCC $
.CC$ %
ToArrayCC% ,
(CC, -
)CC- .
;CC. /
}DD 
}EE 
returnGG 
OkGG 
(GG 
newGG 
{HH 
fotoII 
=II 
bII 
}JJ 
)JJ 
;JJ 
}KK 	
[MM 	
HttpPostMM	 
(MM 
$strMM $
)MM$ %
]MM% &
publicNN 
asyncNN 
TaskNN 
<NN 
ActionResultNN &
>NN& '
RegistrarUsuarioNN( 8
(NN8 9
RegistroViewModelNN9 J
modelNNK P
)NNP Q
{OO 	
ifPP 
(PP 

ModelStatePP 
.PP 
IsValidPP "
)PP" #
{QQ 
IdentityResultRR 
usuarioCriadoRR ,
;RR, -
stringSS 
funcaoUsuarioSS $
;SS$ %
UsuarioUU 
usuarioUU 
=UU  !
newUU" %
UsuarioUU& -
{VV 
UserNameWW 
=WW 
modelWW $
.WW$ %
NomeUsuarioWW% 0
,WW0 1
EmailXX 
=XX 
modelXX !
.XX! "
EmailXX" '
,XX' (
PasswordHashYY  
=YY! "
modelYY# (
.YY( )
SenhaYY) .
,YY. /
CPFZZ 
=ZZ 
modelZZ 
.ZZ  
CPFZZ  #
,ZZ# $
	Profissao[[ 
=[[ 
model[[  %
.[[% &
	Profissao[[& /
,[[/ 0
Foto\\ 
=\\ 
model\\  
.\\  !
Foto\\! %
}]] 
;]] 
if__ 
(__ 
await__ 
_usuarioRepositorio__ -
.__- ..
"ObterQuantidadeUsuariosRegistrados__. P
(__P Q
)__Q R
>__S T
$num__U V
)__V W
{`` 
funcaoUsuarioaa !
=aa" #
$straa$ -
;aa- .
}bb 
elsecc 
{dd 
funcaoUsuarioee !
=ee" #
$stree$ 3
;ee3 4
}ff 
usuarioCriadohh 
=hh 
awaithh  %
_usuarioRepositoriohh& 9
.hh9 :
CriarUsuariohh: F
(hhF G
usuariohhG N
,hhN O
modelhhP U
.hhU V
SenhahhV [
)hh[ \
;hh\ ]
ifjj 
(jj 
usuarioCriadojj !
.jj! "
	Succeededjj" +
)jj+ ,
{kk 
awaitll 
_usuarioRepositorioll -
.ll- ."
IncluirUsuarioEmFuncaoll. D
(llD E
usuariollE L
,llL M
funcaoUsuariollN [
)ll[ \
;ll\ ]
varmm 
tokenmm 
=mm 
TokenServicemm  ,
.mm, -

GerarTokenmm- 7
(mm7 8
usuariomm8 ?
,mm? @
funcaoUsuariommA N
)mmN O
;mmO P
awaitnn 
_usuarioRepositorionn -
.nn- .
LogarUsuarionn. :
(nn: ;
usuarionn; B
,nnB C
falsennD I
)nnI J
;nnJ K
returnpp 
Okpp 
(pp 
newpp !
{qq 
emailUsuarioLogadorr *
=rr+ ,
usuariorr- 4
.rr4 5
Emailrr5 :
,rr: ;
	usuarioIdss !
=ss" #
usuarioss$ +
.ss+ ,
Idss, .
,ss. /
tokenUsuarioLogadott *
=tt+ ,
tokentt- 2
}uu 
)uu 
;uu 
}vv 
elsexx 
{yy 
returnzz 

BadRequestzz %
(zz% &
modelzz& +
)zz+ ,
;zz, -
}{{ 
}|| 
return~~ 

BadRequest~~ 
(~~ 
model~~ #
)~~# $
;~~$ %
}
ÄÄ 	
[
ÇÇ 	
HttpPost
ÇÇ	 
(
ÇÇ 
$str
ÇÇ  
)
ÇÇ  !
]
ÇÇ! "
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
ActionResult
ÉÉ &
>
ÉÉ& '
LogarUsuario
ÉÉ( 4
(
ÉÉ4 5
LoginViewModel
ÉÉ5 C
model
ÉÉD I
)
ÉÉI J
{
ÑÑ 	
if
ÖÖ 
(
ÖÖ 
model
ÖÖ 
==
ÖÖ 
null
ÖÖ 
)
ÖÖ 
return
ÜÜ 
NotFound
ÜÜ 
(
ÜÜ  
$str
ÜÜ  ?
)
ÜÜ? @
;
ÜÜ@ A
Usuario
àà 
usuario
àà 
=
àà 
await
àà #!
_usuarioRepositorio
àà$ 7
.
àà7 8#
ObterUsuarioPeloEmail
àà8 M
(
ààM N
model
ààN S
.
ààS T
Email
ààT Y
)
ààY Z
;
ààZ [
if
ää 
(
ää 
usuario
ää 
!=
ää 
null
ää 
)
ää  
{
ãã 
PasswordHasher
åå 
<
åå 
Usuario
åå &
>
åå& '
passwordHasher
åå( 6
=
åå7 8
new
åå9 <
PasswordHasher
åå= K
<
ååK L
Usuario
ååL S
>
ååS T
(
ååT U
)
ååU V
;
ååV W
if
çç 
(
çç 
passwordHasher
çç "
.
çç" #"
VerifyHashedPassword
çç# 7
(
çç7 8
usuario
çç8 ?
,
çç? @
usuario
ççA H
.
ççH I
PasswordHash
ççI U
,
ççU V
model
ççW \
.
çç\ ]
Senha
çç] b
)
ççb c
!=
ççd f)
PasswordVerificationResultççg Å
.ççÅ Ç
FailedççÇ à
)ççà â
{
éé 
var
èè 
funcoesUsuario
èè &
=
èè' (
await
èè) .!
_usuarioRepositorio
èè/ B
.
èèB C!
ObterFuncoesUsuario
èèC V
(
èèV W
usuario
èèW ^
)
èè^ _
;
èè_ `
var
êê 
token
êê 
=
êê 
TokenService
êê  ,
.
êê, -

GerarToken
êê- 7
(
êê7 8
usuario
êê8 ?
,
êê? @
funcoesUsuario
êêA O
.
êêO P
First
êêP U
(
êêU V
)
êêV W
)
êêW X
;
êêX Y
await
ëë !
_usuarioRepositorio
ëë -
.
ëë- .
LogarUsuario
ëë. :
(
ëë: ;
usuario
ëë; B
,
ëëB C
false
ëëD I
)
ëëI J
;
ëëJ K
return
ìì 
Ok
ìì 
(
ìì 
new
ìì !
{
îî  
emailUsuarioLogado
ïï *
=
ïï+ ,
usuario
ïï- 4
.
ïï4 5
Email
ïï5 :
,
ïï: ;
	usuarioId
ññ !
=
ññ" #
usuario
ññ$ +
.
ññ+ ,
Id
ññ, .
,
ññ. / 
tokenUsuarioLogado
óó *
=
óó+ ,
token
óó- 2
}
òò 
)
òò 
;
òò 
}
ôô 
return
õõ 
NotFound
õõ 
(
õõ  
$str
õõ  >
)
õõ> ?
;
õõ? @
}
úú 
return
ûû 
NotFound
ûû 
(
ûû 
$str
ûû :
)
ûû: ;
;
ûû; <
}
üü 	
[
°° 	
HttpGet
°°	 
(
°° 
$str
°° 2
)
°°2 3
]
°°3 4
public
¢¢ 
async
¢¢ 
Task
¢¢ 
<
¢¢ 
dynamic
¢¢ !
>
¢¢! "!
RetornarFotoUsuario
¢¢# 6
(
¢¢6 7
string
¢¢7 =
	usuarioId
¢¢> G
)
¢¢G H
{
££ 	
Usuario
§§ 
usuario
§§ 
=
§§ 
await
§§ #!
_usuarioRepositorio
§§$ 7
.
§§7 8
ObterPeloId
§§8 C
(
§§C D
	usuarioId
§§D M
)
§§M N
;
§§N O
return
¶¶ 
new
¶¶ 
{
¶¶ 
imagem
¶¶ 
=
¶¶  !
usuario
¶¶" )
.
¶¶) *
Foto
¶¶* .
}
¶¶/ 0
;
¶¶0 1
}
ßß 	
[
©© 	
HttpPut
©©	 
(
©© 
$str
©© #
)
©©# $
]
©©$ %
public
™™ 
async
™™ 
Task
™™ 
<
™™ 
ActionResult
™™ &
>
™™& '
AtualizarUsuario
™™( 8
(
™™8 9'
AtualizarUsuarioViewModel
™™9 R
model
™™S X
)
™™X Y
{
´´ 	
if
¨¨ 
(
¨¨ 

ModelState
¨¨ 
.
¨¨ 
IsValid
¨¨ "
)
¨¨" #
{
≠≠ 
Usuario
ÆÆ 
usuario
ÆÆ 
=
ÆÆ  !
await
ÆÆ" '!
_usuarioRepositorio
ÆÆ( ;
.
ÆÆ; <
ObterPeloId
ÆÆ< G
(
ÆÆG H
model
ÆÆH M
.
ÆÆM N
Id
ÆÆN P
)
ÆÆP Q
;
ÆÆQ R
usuario
ØØ 
.
ØØ 
UserName
ØØ  
=
ØØ! "
model
ØØ# (
.
ØØ( )
UserName
ØØ) 1
;
ØØ1 2
usuario
∞∞ 
.
∞∞ 
Email
∞∞ 
=
∞∞ 
model
∞∞  %
.
∞∞% &
Email
∞∞& +
;
∞∞+ ,
usuario
±± 
.
±± 
CPF
±± 
=
±± 
model
±± #
.
±±# $
CPF
±±$ '
;
±±' (
usuario
≤≤ 
.
≤≤ 
	Profissao
≤≤ !
=
≤≤" #
model
≤≤$ )
.
≤≤) *
	Profissao
≤≤* 3
;
≤≤3 4
usuario
≥≥ 
.
≥≥ 
Foto
≥≥ 
=
≥≥ 
model
≥≥ $
.
≥≥$ %
Foto
≥≥% )
;
≥≥) *
await
µµ !
_usuarioRepositorio
µµ )
.
µµ) *
AtualizarUsuario
µµ* :
(
µµ: ;
usuario
µµ; B
)
µµB C
;
µµC D
return
∑∑ 
Ok
∑∑ 
(
∑∑ 
new
∑∑ 
{
∏∏ 
mensagem
ππ 
=
ππ 
$"
ππ !
$str
ππ! )
{
ππ) *
usuario
ππ* 1
.
ππ1 2
Email
ππ2 7
}
ππ7 8
$str
ππ8 O
"
ππO P
}
∫∫ 
)
∫∫ 
;
∫∫ 
}
ªª 
return
ΩΩ 

BadRequest
ΩΩ 
(
ΩΩ 
model
ΩΩ #
)
ΩΩ# $
;
ΩΩ$ %
}
ææ 	
[
¿¿ 	

HttpDelete
¿¿	 
(
¿¿ 
$str
¿¿ 
)
¿¿ 
]
¿¿ 
[
¡¡ 	
	Authorize
¡¡	 
(
¡¡ 
Roles
¡¡ 
=
¡¡ 
$str
¡¡ *
)
¡¡* +
]
¡¡+ ,
public
¬¬ 
async
¬¬ 
Task
¬¬ 
<
¬¬ 
ActionResult
¬¬ &
<
¬¬& '
Usuario
¬¬' .
>
¬¬. /
>
¬¬/ 0
DeleteUsuario
¬¬1 >
(
¬¬> ?
string
¬¬? E
id
¬¬F H
)
¬¬H I
{
√√ 	
var
ƒƒ 
usuario
ƒƒ 
=
ƒƒ 
await
ƒƒ !
_usuarioRepositorio
ƒƒ  3
.
ƒƒ3 4
ObterPeloId
ƒƒ4 ?
(
ƒƒ? @
id
ƒƒ@ B
)
ƒƒB C
;
ƒƒC D
if
≈≈ 
(
≈≈ 
usuario
≈≈ 
==
≈≈ 
null
≈≈ 
)
≈≈  
{
∆∆ 
return
«« 
NotFound
«« 
(
««  
)
««  !
;
««! "
}
»» 
await
   !
_usuarioRepositorio
   %
.
  % &
Excluir
  & -
(
  - .
id
  . 0
)
  0 1
;
  1 2
return
ÃÃ 
Ok
ÃÃ 
(
ÃÃ 
new
ÃÃ 
{
ÕÕ 
mensagem
ŒŒ 
=
ŒŒ 
$"
ŒŒ 
$str
ŒŒ %
{
ŒŒ% &
usuario
ŒŒ' .
.
ŒŒ. /
UserName
ŒŒ/ 7
}
ŒŒ8 9
$str
ŒŒ9 O
"
ŒŒO P
}
œœ 
)
œœ 
;
œœ 
}
–– 	
}
““ 
}”” ƒ
_C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Extensions\ConfiguracaoIdentityExtension.cs
	namespace 	
MyWallet
 
. 
API 
. 

Extensions !
{ 
public 

static 
class )
ConfiguracaoIdentityExtension 5
{ 
public 
static 
void "
ConfigurarSenhaUsuario 1
(1 2
this2 6
IServiceCollection7 I
servicesJ R
)R S
{		 	
services

 
.

 
	Configure

 
<

 
IdentityOptions

 .
>

. /
(

/ 0
opcoes

0 6
=>

7 9
{ 
opcoes 
. 
Password 
.  
RequireDigit  ,
=- .
false/ 4
;4 5
opcoes 
. 
Password 
.  
RequireLowercase  0
=1 2
false3 8
;8 9
opcoes 
. 
Password 
.  
RequiredLength  .
=/ 0
$num1 2
;2 3
opcoes 
. 
Password 
.  "
RequireNonAlphanumeric  6
=7 8
false9 >
;> ?
opcoes 
. 
Password 
.  
RequireUppercase  0
=1 2
false3 8
;8 9
opcoes 
. 
Password 
.  
RequiredUniqueChars  3
=4 5
$num6 7
;7 8
} 
) 
; 
} 	
} 
} æ

>C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Program.cs
	namespace

 	
ControleFinanceiro


 
.

 
API

  
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} Ó
LC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Services\TokenService.cs
	namespace 	
MyWallet
 
. 
API 
. 
Services 
{		 
public

 

static

 
class

 
TokenService

 $
{ 
public 
static 
string 

GerarToken '
(' (
Usuario( /
usuario0 7
,7 8
string9 ?
funcaoUsuario@ M
)M N
{ 	
var 
tokenHandler 
= 
new "#
JwtSecurityTokenHandler# :
(: ;
); <
;< =
var 
chave 
= 
Encoding  
.  !
ASCII! &
.& '
GetBytes' /
(/ 0
Settings0 8
.8 9
ChaveSecreta9 E
)E F
;F G
var 
tokenDescriptor 
=  !
new" %#
SecurityTokenDescriptor& =
{ 
Subject 
= 
new 
ClaimsIdentity ,
(, -
new- 0
Claim1 6
[6 7
]7 8
{ 
new 
Claim 
( 

ClaimTypes (
.( )
Name) -
,- .
usuario/ 6
.6 7
UserName7 ?
.? @
ToString@ H
(H I
)I J
)J K
,K L
new 
Claim 
( 

ClaimTypes (
.( )
Role) -
,- .
funcaoUsuario/ <
)< =
} 
) 
, 
Expires 
= 
DateTime "
." #
UtcNow# )
.) *
AddHours* 2
(2 3
$num3 4
)4 5
,5 6
SigningCredentials "
=# $
new% (
SigningCredentials) ;
(; <
new< ? 
SymmetricSecurityKey@ T
(T U
chaveU Z
)Z [
,[ \
SecurityAlgorithms] o
.o p 
HmacSha256Signature	p É
)
É Ñ
} 
; 
var 
token 
= 
tokenHandler $
.$ %
CreateToken% 0
(0 1
tokenDescriptor1 @
)@ A
;A B
return 
tokenHandler 
.  

WriteToken  *
(* +
token+ 0
)0 1
;1 2
} 	
} 
}   †
?C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Settings.cs
	namespace 	
MyWallet
 
. 
API 
{ 
public 

static 
class 
Settings  
{ 
public 
static 
string 
ChaveSecreta )
=* +
Guid, 0
.0 1
NewGuid1 8
(8 9
)9 :
.: ;
ToString; C
(C D
)D E
;E F
} 
}		 ìp
>C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Startup.cs
	namespace 	
ControleFinanceiro
 
. 
API  
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public!! 
IConfiguration!! 
Configuration!! +
{!!, -
get!!. 1
;!!1 2
}!!3 4
public$$ 
void$$ 
ConfigureServices$$ %
($$% &
IServiceCollection$$& 8
services$$9 A
)$$A B
{%% 	
services&& 
.&& 
AddDbContext&& !
<&&! "
Contexto&&" *
>&&* +
(&&+ ,
opcoes&&, 2
=>&&3 5
opcoes&&6 <
.&&< =
UseSqlServer&&= I
(&&I J
Configuration&&J W
.&&W X
GetConnectionString&&X k
(&&k l
$str&&l w
)&&w x
)&&x y
)&&y z
;&&z {
services'' 
.'' 
AddIdentity''  
<''  !
Usuario''! (
,''( )
Funcao''* 0
>''0 1
(''1 2
)''2 3
.''3 4$
AddEntityFrameworkStores''4 L
<''L M
Contexto''M U
>''U V
(''V W
)''W X
;''X Y
services)) 
.)) "
ConfigurarSenhaUsuario)) +
())+ ,
))), -
;))- .
services++ 
.++ 
	AddScoped++ 
<++ 
ICartaoRepositorio++ 1
,++1 2
CartaoRepositorio++3 D
>++D E
(++E F
)++F G
;++G H
services,, 
.,, 
	AddScoped,, 
<,, !
ICategoriaRepositorio,, 4
,,,4 5 
CategoriaRepositorio,,6 J
>,,J K
(,,K L
),,L M
;,,M N
services-- 
.-- 
	AddScoped-- 
<-- 
IDespesaRepositorio-- 2
,--2 3
DespesaRepositorio--4 F
>--F G
(--G H
)--H I
;--I J
services.. 
... 
	AddScoped.. 
<.. 
IReservaRepositorio.. 2
,..2 3
ReservaRepositorio..4 F
>..F G
(..G H
)..H I
;..I J
services// 
.// 
	AddScoped// 
<// (
ITipoMovimentacaoRepositorio// ;
,//; <'
TipoMovimentacaoRepositorio//= X
>//X Y
(//Y Z
)//Z [
;//[ \
services00 
.00 
	AddScoped00 
<00 
IMetaRepositorio00 /
,00/ 0
MetaRepositorio001 @
>00@ A
(00A B
)00B C
;00C D
services11 
.11 
	AddScoped11 
<11 
IMesRepositorio11 .
,11. /
MesRepositorio110 >
>11> ?
(11? @
)11@ A
;11A B
services22 
.22 
	AddScoped22 
<22 
IGanhosRepositorio22 1
,221 2
GanhoRepositorio223 C
>22C D
(22D E
)22E F
;22F G
services33 
.33 
	AddScoped33 
<33 
IFuncaoRepositorio33 1
,331 2
FuncaoRepositorio333 D
>33D E
(33E F
)33F G
;33G H
services44 
.44 
	AddScoped44 
<44 
IUsuarioRepositorio44 2
,442 3
UsuarioRepositorio444 F
>44F G
(44G H
)44H I
;44I J
services55 
.55 
	AddScoped55 
<55 
IGraficoRepositorio55 2
,552 3
GraficoRepositorio554 F
>55F G
(55G H
)55H I
;55I J
services77 
.77 
AddTransient77 !
<77! "

IValidator77" ,
<77, -
	Categoria77- 6
>776 7
,777 8
CategoriaValidator779 K
>77K L
(77L M
)77M N
;77N O
services88 
.88 
AddTransient88 !
<88! "

IValidator88" ,
<88, -
Cartao88- 3
>883 4
,884 5
CartaoValidator886 E
>88E F
(88F G
)88G H
;88H I
services99 
.99 
AddTransient99 !
<99! "

IValidator99" ,
<99, -
Despesa99- 4
>994 5
,995 6
DespesaValidator997 G
>99G H
(99H I
)99I J
;99J K
services:: 
.:: 
AddTransient:: !
<::! "

IValidator::" ,
<::, -
Ganho::- 2
>::2 3
,::3 4
GanhoValidator::5 C
>::C D
(::D E
)::E F
;::F G
services;; 
.;; 
AddTransient;; !
<;;! "

IValidator;;" ,
<;;, -
Reserva;;- 4
>;;4 5
,;;5 6
ReservaValidator;;7 G
>;;G H
(;;H I
);;I J
;;;J K
services<< 
.<< 
AddTransient<< !
<<<! "

IValidator<<" ,
<<<, -
TipoMovimentacao<<- =
><<= >
,<<> ?%
TipoMovimentacaoValidator<<@ Y
><<Y Z
(<<Z [
)<<[ \
;<<\ ]
services== 
.== 
AddTransient== !
<==! "

IValidator==" ,
<==, -
Meta==- 1
>==1 2
,==2 3
MetaValidator==4 A
>==A B
(==B C
)==C D
;==D E
services?? 
.?? 
AddTransient?? !
<??! "

IValidator??" ,
<??, -
FuncoesViewModel??- =
>??= >
,??> ?%
FuncoesViewModelValidator??@ Y
>??Y Z
(??Z [
)??[ \
;??\ ]
services@@ 
.@@ 
AddTransient@@ !
<@@! "

IValidator@@" ,
<@@, -
RegistroViewModel@@- >
>@@> ?
,@@? @&
RegistroViewModelValidator@@A [
>@@[ \
(@@\ ]
)@@] ^
;@@^ _
servicesAA 
.AA 
AddTransientAA !
<AA! "

IValidatorAA" ,
<AA, -
LoginViewModelAA- ;
>AA; <
,AA< =#
LoginViewModelValidatorAA> U
>AAU V
(AAV W
)AAW X
;AAX Y
servicesBB 
.BB 
AddTransientBB !
<BB! "

IValidatorBB" ,
<BB, -%
AtualizarUsuarioViewModelBB- F
>BBF G
,BBG H.
"AtualizarUsuarioViewModelValidatorBBI k
>BBk l
(BBl m
)BBm n
;BBn o
servicesDD 
.DD 
AddCorsDD 
(DD 
)DD 
;DD 
servicesFF 
.FF 
AddSpaStaticFilesFF &
(FF& '
	diretorioFF' 0
=>FF1 3
{GG 
	diretorioHH 
.HH 
RootPathHH "
=HH# $
$strHH% 2
;HH2 3
}II 
)II 
;II 
varKK 
keyKK 
=KK 
EncodingKK 
.KK 
ASCIIKK $
.KK$ %
GetBytesKK% -
(KK- .
SettingsKK. 6
.KK6 7
ChaveSecretaKK7 C
)KKC D
;KKD E
servicesLL 
.LL 
AddAuthenticationLL &
(LL& '
opcoesLL' -
=>LL. 0
{MM 
opcoesNN 
.NN %
DefaultAuthenticateSchemeNN 0
=NN1 2
JwtBearerDefaultsNN3 D
.NND E 
AuthenticationSchemeNNE Y
;NNY Z
opcoesOO 
.OO "
DefaultChallengeSchemeOO -
=OO. /
JwtBearerDefaultsOO0 A
.OOA B 
AuthenticationSchemeOOB V
;OOV W
}PP 
)PP 
.QQ 
AddJwtBearerQQ 
(QQ 
opcoesQQ $
=>QQ% '
{RR 
opcoesSS 
.SS  
RequireHttpsMetadataSS /
=SS0 1
falseSS2 7
;SS7 8
opcoesTT 
.TT 
	SaveTokenTT $
=TT% &
trueTT' +
;TT+ ,
opcoesUU 
.UU %
TokenValidationParametersUU 4
=UU5 6
newUU7 :%
TokenValidationParametersUU; T
{VV $
ValidateIssuerSigningKeyWW 0
=WW1 2
trueWW3 7
,WW7 8
IssuerSigningKeyXX (
=XX) *
newXX+ . 
SymmetricSecurityKeyXX/ C
(XXC D
keyXXD G
)XXG H
,XXH I
ValidateIssuerYY &
=YY' (
falseYY) .
,YY. /
ValidateAudienceZZ (
=ZZ) *
falseZZ+ 0
}[[ 
;[[ 
}\\ 
)\\ 
;\\ 
services^^ 
.^^ 
AddControllers^^ #
(^^# $
)^^$ %
.__ 
AddFluentValidation__ $
(__$ %
)__% &
.`` 
AddJsonOptions`` 
(``  
opcoes``  &
=>``' )
{aa 
opcoesbb 
.bb !
JsonSerializerOptionsbb 0
.bb0 1
IgnoreNullValuesbb1 A
=bbB C
truebbD H
;bbH I
}cc 
)cc 
.dd 
AddNewtonsoftJsondd "
(dd" #
opcoesdd# )
=>dd* ,
{ee 
opcoesff 
.ff 
SerializerSettingsff -
.ff- .!
ReferenceLoopHandlingff. C
=ffD E

NewtonsoftffF P
.ffP Q
JsonffQ U
.ffU V!
ReferenceLoopHandlingffV k
.ffk l
Ignoreffl r
;ffr s
}gg 
)gg 
;gg 
serviceshh 
.hh 
AddRazorPageshh "
(hh" #
)hh# $
;hh$ %
servicesjj 
.jj 
AddSwaggerGenjj "
(jj" #
cjj# $
=>jj% '
{kk 
cll 
.ll 

SwaggerDocll 
(ll 
$strll !
,ll! "
newll# &
OpenApiInfoll' 2
{ll3 4
Titlell5 :
=ll; <
$strll= G
,llG H
VersionllI P
=llQ R
$strllS W
}llX Y
)llY Z
;llZ [
}mm 
)mm 
;mm 
}nn 	
publicqq 
voidqq 
	Configureqq 
(qq 
IApplicationBuilderqq 1
appqq2 5
,qq5 6
IWebHostEnvironmentqq7 J
envqqK N
)qqN O
{rr 	
ifss 
(ss 
envss 
.ss 
IsDevelopmentss !
(ss! "
)ss" #
)ss# $
{tt 
appuu 
.uu %
UseDeveloperExceptionPageuu -
(uu- .
)uu. /
;uu/ 0
}vv 
elseww 
{xx 
appyy 
.yy 
UseExceptionHandleryy '
(yy' (
$stryy( 0
)yy0 1
;yy1 2
appzz 
.zz 
UseHstszz 
(zz 
)zz 
;zz 
}{{ 
app}} 
.}} 
UseCors}} 
(}} 
opcoes}} 
=>}} !
opcoes}}" (
.~~$ %
AllowAnyOrigin~~% 3
(~~3 4
)~~4 5
.$ %
AllowAnyMethod% 3
(3 4
)4 5
.
ÄÄ$ %
AllowAnyHeader
ÄÄ% 3
(
ÄÄ3 4
)
ÄÄ4 5
)
ÄÄ5 6
;
ÄÄ6 7
app
ÇÇ 
.
ÇÇ !
UseHttpsRedirection
ÇÇ #
(
ÇÇ# $
)
ÇÇ$ %
;
ÇÇ% &
app
ÑÑ 
.
ÑÑ 

UseRouting
ÑÑ 
(
ÑÑ 
)
ÑÑ 
;
ÑÑ 
app
ÜÜ 
.
ÜÜ 
UseAuthentication
ÜÜ !
(
ÜÜ! "
)
ÜÜ" #
;
ÜÜ# $
app
àà 
.
àà 
UseAuthorization
àà  
(
àà  !
)
àà! "
;
àà" #
app
ää 
.
ää 
UseStaticFiles
ää 
(
ää 
)
ää  
;
ää  !
app
åå 
.
åå 
UseSpaStaticFiles
åå !
(
åå! "
)
åå" #
;
åå# $
app
éé 
.
éé 
UseEndpoints
éé 
(
éé 
	endpoints
éé &
=>
éé' )
{
èè 
	endpoints
êê 
.
êê 
MapControllers
êê (
(
êê( )
)
êê) *
;
êê* +
}
ëë 
)
ëë 
;
ëë 
app
ìì 
.
ìì 

UseSwagger
ìì 
(
ìì 
)
ìì 
;
ìì 
app
ïï 
.
ïï 
UseSwaggerUI
ïï 
(
ïï 
c
ïï 
=>
ïï !
{
ïï" #
c
ññ 
.
ññ 
RoutePrefix
ññ 
=
ññ 
$str
ññ  )
;
ññ) *
c
óó 
.
óó 
SwaggerEndpoint
óó !
(
óó! "
$str
óó" <
,
óó< =
$str
óó> B
)
óóB C
;
óóC D
}
òò 
)
òò 
;
òò 
app
öö 
.
öö 
UseSpa
öö 
(
öö 
spa
öö 
=>
öö 
{
õõ 
spa
úú 
.
úú 
Options
úú 
.
úú 

SourcePath
úú &
=
úú' (
Path
úú) -
.
úú- .
Combine
úú. 5
(
úú5 6
	Directory
úú6 ?
.
úú? @!
GetCurrentDirectory
úú@ S
(
úúS T
)
úúT U
,
úúU V
$str
úúW d
)
úúd e
;
úúe f
if
ûû 
(
ûû 
env
ûû 
.
ûû 
IsDevelopment
ûû %
(
ûû% &
)
ûû& '
)
ûû' (
{
üü 
spa
†† 
.
†† ,
UseProxyToSpaDevelopmentServer
†† 6
(
††6 7
$"
††7 9
$str
††9 O
"
††O P
)
††P Q
;
††Q R
}
°° 
}
¢¢ 
)
¢¢ 
;
¢¢ 
}
££ 	
}
§§ 
}•• "
dC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\AtualizarUsuarioViewModelValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class .
"AtualizarUsuarioViewModelValidator 3
:4 5
AbstractValidator6 G
<G H%
AtualizarUsuarioViewModelH a
>a b
{ 
public .
"AtualizarUsuarioViewModelValidator 1
(1 2
)2 3
{		 	
RuleFor

 
(

 
g

 
=>

 
g

 
.

 
UserName

 #
)

# $
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' C
)C D
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( D
)D E
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ E
)E F
;F G
RuleFor 
( 
r 
=> 
r 
. 
CPF 
) 
. 
NotNull 
( 
) 
. 
WithMessage %
(% &
$str& 6
)6 7
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' 7
)7 8
. 
MinimumLength 
( 
$num 
)  
.  !
WithMessage! ,
(, -
$str- B
)B C
. 
MaximumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. D
)D E
;E F
RuleFor 
( 
r 
=> 
r 
. 
	Profissao $
)$ %
. 
NotNull 
( 
) 
. 
WithMessage %
(% &
$str& <
)< =
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' =
)= >
. 
MinimumLength 
( 
$num 
)  
.  !
WithMessage! ,
(, -
$str- B
)B C
. 
MaximumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. D
)D E
;E F
RuleFor 
( 
f 
=> 
f 
. 
Foto 
)  
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 7
)7 8
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( 8
)8 9
;9 :
RuleFor   
(   
r   
=>   
r   
.   
Email    
)    !
.!! 
NotNull!! 
(!! 
)!! 
.!! 
WithMessage!! %
(!!% &
$str!!& 8
)!!8 9
."" 
NotEmpty"" 
("" 
)"" 
."" 
WithMessage"" &
(""& '
$str""' 9
)""9 :
.## 
MinimumLength## 
(## 
$num##  
)##  !
.##! "
WithMessage##" -
(##- .
$str##. C
)##C D
.$$ 
MaximumLength$$ 
($$ 
$num$$  
)$$  !
.$$! "
WithMessage$$" -
($$- .
$str$$. D
)$$D E
.%% 
EmailAddress%% 
(%% 
)%% 
.%% 
WithMessage%% *
(%%* +
$str%%+ ;
)%%; <
;%%< =
}&& 	
}'' 
}(( ⁄
QC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\CartaoValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class 
CartaoValidator  
:! "
AbstractValidator# 4
<4 5
Cartao5 ;
>; <
{ 
public 
CartaoValidator 
( 
)  
{		 	
RuleFor

 
(

 
c

 
=>

 
c

 
.

 
Nome

 
)

  
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' B
)B C
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( C
)C D
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ E
)E F
;F G
RuleFor 
( 
c 
=> 
c 
. 
Bandeira #
)# $
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' F
)F G
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( G
)G H
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ E
)E F
;F G
RuleFor 
( 
c 
=> 
c 
. 
Numero !
)! "
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' D
)D E
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( E
)E F
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ E
)E F
;F G
RuleFor 
( 
c 
=> 
c 
. 
Limite !
)! "
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' D
)D E
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( E
)E F
;F G
} 	
}   
}!! √
TC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\CategoriaValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class 
CategoriaValidator #
:# $
AbstractValidator% 6
<6 7
	Categoria7 @
>@ A
{ 
public 
CategoriaValidator !
(! "
)" #
{		 	
RuleFor

 
(

 
c

 
=>

 
c

 
.

 
Nome

 
)

  
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' D
)D E
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( E
)E F
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. P
)P Q
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ R
)R S
;S T
RuleFor 
( 
c 
=> 
c 
. 
Icone  
)  !
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' E
)E F
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( F
)F G
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. N
)N O
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ R
)R S
;S T
RuleFor 
( 
c 
=> 
c 
. 
IdTipoMovimentacao -
)- .
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' D
)D E
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( E
)E F
;F G
} 	
} 
} ˛
RC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\DespesaValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class 
DespesaValidator !
:" #
AbstractValidator$ 5
<5 6
Despesa6 =
>= >
{ 
public 
DespesaValidator 
(  
)  !
{		 	
RuleFor

 
(

 
d

 
=>

 
d

 
.

 
CartaoId

 #
)

# $
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( :
): ;
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 9
)9 :
;: ;
RuleFor 
( 
g 
=> 
g 
. 
CategoriaId &
)& '
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' <
)< =
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( =
)= >
;> ?
RuleFor 
( 
d 
=> 
d 
. 
	Descricao $
)$ %
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' =
)= >
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( >
)> ?
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ D
)D E
;E F
RuleFor 
( 
d 
=> 
d 
. 
Valor  
)  !
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 9
)9 :
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( :
): ;
. 
InclusiveBetween !
(! "
$num" #
,# $
double% +
.+ ,
MaxValue, 4
)4 5
.5 6
WithMessage6 A
(A B
$strB R
)R S
;S T
RuleFor 
( 
d 
=> 
d 
. 
MesId  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( 7
)7 8
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 6
)6 7
;7 8
RuleFor!! 
(!! 
d!! 
=>!! 
d!! 
.!! 
Ano!! 
)!! 
."" 
NotNull"" 
("" 
)"" 
."" 
WithMessage"" %
(""% &
$str""& 6
)""6 7
.## 
NotEmpty## 
(## 
)## 
.## 
WithMessage## &
(##& '
$str##' 7
)##7 8
.$$ 
InclusiveBetween$$  
($$  !
$num$$! %
,$$% &
$num$$' +
)$$+ ,
.$$, -
WithMessage$$- 8
($$8 9
$str$$9 I
)$$I J
;$$J K
}%% 	
}&& 
}'' è
[C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\FuncoesViewModelValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class %
FuncoesViewModelValidator *
:+ ,
AbstractValidator- >
<> ?
FuncoesViewModel? O
>O P
{ 
public %
FuncoesViewModelValidator (
(( )
)) *
{		 	
RuleFor

 
(

 
f

 
=>

 
f

 
.

 
Name

 
)

  
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' :
): ;
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( ;
); <
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ D
)D E
;E F
RuleFor 
( 
f 
=> 
f 
. 
	Descricao $
)$ %
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' =
)= >
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( >
)> ?
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ D
)D E
;E F
} 	
} 
} «!
PC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\GanhoValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class 
GanhoValidator 
:  !
AbstractValidator" 3
<3 4
Ganho4 9
>9 :
{ 
public 
GanhoValidator 
( 
) 
{		 	
RuleFor

 
(

 
g

 
=>

 
g

 
.

 
	Descricao

 $
)

$ %
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' ;
); <
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( <
)< =
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ E
)E F
;F G
RuleFor 
( 
g 
=> 
g 
. 
CategoriaId &
)& '
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' <
)< =
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( =
)= >
;> ?
RuleFor 
( 
g 
=> 
g 
. 
Valor  
)  !
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 7
)7 8
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( 8
)8 9
. 
InclusiveBetween !
(! "
$num" #
,# $
double% +
.+ ,
MaxValue, 4
)4 5
.5 6
WithMessage6 A
(A B
$strB R
)R S
;S T
RuleFor 
( 
g 
=> 
g 
. 
Dia 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 5
)5 6
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( 6
)6 7
. 
InclusiveBetween !
(! "
$num" #
,# $
$num% '
)' (
.( )
WithMessage) 4
(4 5
$str5 C
)C D
;D E
RuleFor 
( 
g 
=> 
g 
. 
MesId  
)  !
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 6
)6 7
.   
NotEmpty   
(   
)   
.   
WithMessage   '
(  ' (
$str  ( 7
)  7 8
;  8 9
RuleFor"" 
("" 
g"" 
=>"" 
g"" 
."" 
Ano"" 
)"" 
.## 
NotNull## 
(## 
)## 
.## 
WithMessage## &
(##& '
$str##' 5
)##5 6
.$$ 
NotEmpty$$ 
($$ 
)$$ 
.$$ 
WithMessage$$ '
($$' (
$str$$( 6
)$$6 7
.%% 
InclusiveBetween%% !
(%%! "
$num%%" &
,%%& '
$num%%( ,
)%%, -
.%%- .
WithMessage%%. 9
(%%9 :
$str%%: H
)%%H I
;%%I J
}&& 	
}'' 
}(( Ñ
YC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\LoginViewModelValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class #
LoginViewModelValidator (
:( )
AbstractValidator* ;
<; <
LoginViewModel< J
>J K
{ 
public #
LoginViewModelValidator &
(& '
)' (
{		 	
RuleFor

 
(

 
l

 
=>

 
l

 
.

 
Email

  
)

  !
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 9
)9 :
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( :
): ;
. 
MinimumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ D
)D E
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ E
)E F
;F G
RuleFor 
( 
l 
=> 
l 
. 
Senha  
)  !
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 9
)9 :
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( :
): ;
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ E
)E F
;F G
} 	
} 
} Õ
OC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\MetaValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class 
MetaValidator 
: 
AbstractValidator  1
<1 2
Meta2 6
>6 7
{ 
public 
MetaValidator 
( 
) 
{		 	
RuleFor

 
(

 
c

 
=>

 
c

 
.

 
	Descricao

 $
)

$ %
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' D
)D E
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( E
)E F
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. P
)P Q
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ R
)R S
;S T
RuleFor 
( 
c 
=> 
c 
. 
Valor  
)  !
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 7
)7 8
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( 8
)8 9
. 
InclusiveBetween !
(! "
$num" #
,# $
double% +
.+ ,
MaxValue, 4
)4 5
.5 6
WithMessage6 A
(A B
$strB R
)R S
;S T
RuleFor 
( 
c 
=> 
c 
. 
IdTipoMovimentacao -
)- .
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' G
)G H
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( H
)H I
;I J
} 	
} 
} ˛(
\C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\RegistroViewModelValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class &
RegistroViewModelValidator +
:, -
AbstractValidator. ?
<? @
RegistroViewModel@ Q
>Q R
{ 
public &
RegistroViewModelValidator )
() *
)* +
{		 	
RuleFor

 
(

 
r

 
=>

 
r

 
.

 
NomeUsuario

 &
)

& '
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' C
)C D
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( D
)D E
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ E
)E F
;F G
RuleFor 
( 
r 
=> 
r 
. 
CPF 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 7
)7 8
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( 8
)8 9
. 
MinimumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ D
)D E
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ E
)E F
;F G
RuleFor 
( 
r 
=> 
r 
. 
	Profissao $
)$ %
. 
NotNull 
( 
) 
. 
WithMessage %
(% &
$str& <
)< =
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' =
)= >
. 
MinimumLength 
( 
$num 
)  
.  !
WithMessage! ,
(, -
$str- B
)B C
. 
MaximumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. D
)D E
;E F
RuleFor 
( 
f 
=> 
f 
. 
Foto 
)  
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 7
)7 8
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( 8
)8 9
;9 :
RuleFor   
(   
r   
=>   
r   
.   
Email    
)    !
.!! 
NotNull!! 
(!! 
)!! 
.!! 
WithMessage!! %
(!!% &
$str!!& 8
)!!8 9
."" 
NotEmpty"" 
("" 
)"" 
."" 
WithMessage"" &
(""& '
$str""' 9
)""9 :
.## 
MinimumLength## 
(## 
$num##  
)##  !
.##! "
WithMessage##" -
(##- .
$str##. C
)##C D
.$$ 
MaximumLength$$ 
($$ 
$num$$  
)$$  !
.$$! "
WithMessage$$" -
($$- .
$str$$. D
)$$D E
.%% 
EmailAddress%% 
(%% 
)%% 
.%% 
WithMessage%% *
(%%* +
$str%%+ ;
)%%; <
;%%< =
RuleFor'' 
('' 
r'' 
=>'' 
r'' 
.'' 
Senha''  
)''  !
.(( 
NotNull(( 
((( 
)(( 
.(( 
WithMessage(( $
((($ %
$str((% 7
)((7 8
.)) 
NotEmpty)) 
()) 
))) 
.)) 
WithMessage)) %
())% &
$str))& 8
)))8 9
.** 
MinimumLength** 
(** 
$num** 
)** 
.**  
WithMessage**  +
(**+ ,
$str**, A
)**A B
.++ 
MaximumLength++ 
(++ 
$num++ 
)++  
.++  !
WithMessage++! ,
(++, -
$str++- C
)++C D
;++D E
}.. 	
}// 
}00 ¥
RC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\ReservaValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class 
ReservaValidator !
:" #
AbstractValidator$ 5
<5 6
Reserva6 =
>= >
{ 
public 
ReservaValidator 
(  
)  !
{		 	
RuleFor

 
(

 
g

 
=>

 
g

 
.

 
CategoriaId

 &
)

& '
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' <
)< =
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( =
)= >
;> ?
RuleFor 
( 
d 
=> 
d 
. 
	Descricao $
)$ %
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' =
)= >
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( >
)> ?
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. C
)C D
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ D
)D E
;E F
RuleFor 
( 
d 
=> 
d 
. 
Valor  
)  !
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 9
)9 :
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( :
): ;
. 
InclusiveBetween !
(! "
$num" #
,# $
double% +
.+ ,
MaxValue, 4
)4 5
.5 6
WithMessage6 A
(A B
$strB R
)R S
;S T
RuleFor 
( 
d 
=> 
d 
. 
MesId  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( 7
)7 8
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' 6
)6 7
;7 8
RuleFor 
( 
d 
=> 
d 
. 
Ano 
) 
. 
NotNull 
( 
) 
. 
WithMessage %
(% &
$str& 6
)6 7
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' 7
)7 8
.   
InclusiveBetween    
(    !
$num  ! %
,  % &
$num  ' +
)  + ,
.  , -
WithMessage  - 8
(  8 9
$str  9 I
)  I J
;  J K
}!! 	
}"" 
}## ‡

[C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\Validacoes\TipoMovimentacaoValidator.cs
	namespace 	
MyWallet
 
. 
API 
. 

Validacoes !
{ 
public 

class %
TipoMovimentacaoValidator *
:+ ,
AbstractValidator- >
<> ?
TipoMovimentacao? O
>O P
{ 
public %
TipoMovimentacaoValidator (
(( )
)) *
{		 	
RuleFor

 
(

 
c

 
=>

 
c

 
.

 
Nome

 
)

  
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' O
)O P
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( P
)P Q
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. P
)P Q
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ R
)R S
;S T
} 	
} 
} à

[C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\ViewModels\AtualizarUsuarioViewModel.cs
	namespace 	
MyWallet
 
. 
API 
. 

ViewModels !
{ 
public 

class %
AtualizarUsuarioViewModel *
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public 
string 
CPF 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
	Profissao 
{  !
get" %
;% &
set' *
;* +
}, -
public 
byte 
[ 
] 
Foto 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ì
^C:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\ViewModels\DadosCardsDashboardViewModel.cs
	namespace 	
MyWallet
 
. 
API 
. 

ViewModels !
{ 
public 

class (
DadosCardsDashboardViewModel -
{ 
public 
int 

QtdCartoes 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 

GanhoTotal  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
double		 
DespesaTotal		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public 
double 
ReservaTotal "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
double 
Saldo 
{ 
get !
;! "
set# &
;& '
}( )
} 
} é
RC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\ViewModels\FuncoesViewModel.cs
	namespace 	
MyWallet
 
. 
API 
. 

ViewModels !
{ 
public 

class 
FuncoesViewModel !
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
	Descricao		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
}

 
} Ò
PC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\ViewModels\LoginViewModel.cs
	namespace 	
MyWallet
 
. 
API 
. 

ViewModels !
{ 
public 

class 
LoginViewModel 
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ˛	
SC:\elaine\puc\tcc\projeto\mywallet.api\MyWallet.API\ViewModels\RegistroViewModel.cs
	namespace 	
MyWallet
 
. 
API 
. 

ViewModels !
{ 
public 

class 
RegistroViewModel "
{ 
public 
string 
NomeUsuario !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
CPF 
{ 
get 
;  
set! $
;$ %
}& '
public		 
string		 
	Profissao		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public 
byte 
[ 
] 
Foto 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Senha 
{ 
get !
;! "
set# &
;& '
}( )
} 
} 