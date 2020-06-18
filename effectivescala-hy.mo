<a href="https://github.com/twitter/effectivescala"><img style="position: absolute; top: 0; left: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_left_green_007200.png" alt="Fork me on GitHub"></a>
<script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>

<h1 class="header">Effective Scala</h1>
<address>Marius Eriksen, Twitter Inc.<br />marius@twitter.com (<a href="https://twitter.com/marius">@marius</a>)<br /><br />[translated by Andranik Muradyan(<a href="https://github.com/amuradyan">@spectrum</a>)]</address>

<h2>Բովանդակություն</h2>

.TOC


<h2>Other languages</h2>
<a href="index-ja.html">日本語</a>
<a href="index-ru.html">Русский</a>
<a href="index-cn.html">简体中文</a>
<a href="index.html">English</a>


## Ներածություն

[Scala][Scala]-ն Twitter-ում օգտագործվող հիմանական ծրագրավորման լեզուներից մեկն է։
Մեր ենթակառույցների մեծ մասը գրված է Scala-ով և
[մենք ունենք մի քանի մեծ գրադարան](https://github.com/twitter/),
որոնց մենք սպասարկում ենք։ Լինելով էֆեկտիվ Scala-ն միևնույն ժամանակ լայն լեզու է,
և մեր փորձը մեզ սովորեցրել է այն ուշադիր օգտագործել։
Ի՞նչ թակարդներ կան։ Ո՞ր հատկություններն ենք մենք կիրառում, իսկ որոնցի՞ց խուսափում։
Որ դեպքերում ենք մենք ծրագրավորում "մաքուր ֆունկցիոնալ ոճով" և երբ ոչ։
Կարճ ասած․ ինչպիսի՞ն ենք մենք համարում լեզվի էֆեկտիվ կիրառումը։
Այս ուղեցույցը սեղմում է մեր փորձը կարճ էսսէների, ներկայացնելով մի շարք "լավ մոտեցումներ"։
Մեր Scala-ի փորձը հիմնականում ընկած է լայնածավալ ծառայությունների տիրույթում, որոնք ձևավորում
են բաշխված համակարգեր և մեր խորհուրդները կողմնակալ են, բայց նրանց մեծ մասը ունեն բնական
շարունակություն այլ տիրույթներում։ Սրանք օրենքներ չեն բայց շեղումները պիտի լինեն լավ
հիմնավորված։

Scala-ն տրամադրում է շատ գործիքներ որոնք թույլ են տալիս համառոտ արտահայտվել։
Քիչ տպելը բերում է քիչ կարդալուն, իսկ քիչ կարդալը հաճախ նշանակում է արագ կարդալ, և ուրեմն
համառոտությունը խթանում է հստակությունը։ Համառոտությունը սակայն բութ գործիք է և կարող է 
հանգեցնել հակառակին։ Ծրագրի ճշտությունից հետո, միշտ մտածեք ընթերցողի մասին։

Ամենից առաջ, "ծրագրավորեք Scala-ով"։ Դուք չեք գրում ոչ Java, ոչ Haskell,
ոչ Python; Scala-ով գրված ծրագիրը նման չէ նշվածներից որևէ մեկով գրված ծրագրին։
Լեզուն Էֆեկտիվ կիրառելու համար հարկավոր է խնդիրը ձևակերպել այդ լեզվի տարրերով։
Անիմաստ է Java-ով գրված ծրագիրը "բառացի" թարգմանել Scala-ի քանի որ այն շատ բաներով
կզիջի սկզբնականին։

Սա Scala-ի ներածություն չէ․ մենք ենթադրում ենք, որ ընթերցողը լեզվին ծանոթ է։
Ահա մի քանի Scala սովորելու ռեսուրս․

* [Scala School](https://twitter.github.com/scala_school/)
* [Learning Scala](https://docs.scala-lang.org/)
* [Learning Scala in Small Bites](https://matt.might.net/articles/learning-scala-in-small-bites/)

Սա "կենդանի" ռեսուրս է որը կարող է փոփոխվել, արտացոլելու մեր ներկայիս "լավ մոտեցումները",
բայց առանցքային փոփոխությունները քիչ հավանական են։ Միշտ հաշվի առեք ընթեռնելիությունը․ գրեք
generic կոդ, բայց ոչ ընթեռնելիության հաշվին․ օգտվեք լեզվի պարզ կողմերից որոնք լայն
հնարավորություններ են ընձեռում բայց խուսափեք էզոթերիկ կողմերից (հատկապես տիպերի համակարգի)։
Ամենից առավել, միշտ հստակ հասկացեք թե ինչ եք շահում և ինչ կորցնում տվյալ որոշումը կայացնելիս։
Ծավալուն լեզուն հաճախ բերում է բարդ իրագործման, իսկ բարդությունը բարդություն է ծնում․ դատողության,
իմաստային, ներքին կտորների հաղորդակցման և հաղորդակցման ձեր և ձեր գործընկերների միջև։
Այսպիսով բարդությունը այն գինն է, որը վճարում ենք ծավալունության դիմաց և հարկավոր է համոզվել
որ այն չի գերազանցում շահը։

Եվ հաճույք ստացեք։

## Ձևաչափում

Ձևաչափման մանրամասները, քանի դեռ նրանք կիրառական չեն, մեծ դեր չեն խաղում։
Ըստ սահմանման ոճը չի կարող լինել ինքնին լավը կամ վատը և համարյա բոլորը ունեն
անձնական նախասիրություններ։ Այնուամենայնիվ կոնկրետ ոճին հետևողական լինելը համարյա
միշտ բերում է ընթեռնելիության։ Կոնկրետ ոճին ծանոթ ընթերցողը ստիպված չի լինի հարմարվել
ևս մի քանի լոկալ կանոնի։

Այս կանոնները հատկապես կարևոր են Scala-ի համար, քանի որ նրա քերականությունը ունի շատ
"հոմանիշներ"։ Օրինակներից մեկը մեթոդների կանչի մեխանիզմն է․ մեթոդները կարող են կանչվել
"`.`"-ով, բացատով, փակագծերով, առանց փակագծերի կամ փակագծերով առանց կամ մեկ արգումենտով
մեթոդների համար և այլն։ Ավելին՝ մեթոդի կանչի նման բազմազանությունը ավելի տեսանելի է
դարձնում քերականությունում տարբեր երկիմաստությունները։ Վստահ, գրագետ ընտրված ձևաչափման
կանոնների սիստեմատիկ կիրառումը կարող է լուծել նման երկիմաստությունների խնդիրը թե մարդու
և թե մեքենայի համար։

Մենք հետևում ենք [Scala-ի ձևաչափման ուղեցույցին](https://docs.scala-lang.org/style/)
և հետևյալ կանոններին։

### Բացատներ

Խորության միավոր ընդունեք երկու բացատը։ Խուսափեք 100 նիշից ավել երկարություն ունեցող
տողերից։ Թողեք մեկ դատարկ տող դասերի, մեթոդների և օբյեկտների հայտարարությունների միջև։

### Անուններ

<dl class="rules">
<dt>Օգտագործեք կրճատ անուններ կոդի նեղ հատվածներում</dt>
<dd><code class="prettyprint">i</code>, <code class="prettyprint">j</code> և <code class="prettyprint">k</code> անունները բավականին ընդունելի են 
ցիկլերում։</dd>
<dt>Օգտագործեք երկար անուններ կոդի լայն հատվածներում</dt>
<dd>Արտաքին API-ները պիտի ունենան համեմատաբար երկար, իմաստային և խոսուն անուններ։
		<code class="prettyprint">Future.collect</code> այլ ոչ <code class="prettyprint">Future.all</code>
</dd>
<dt>Օգտագործեք ընդունված հապավումները և խուսափիր էզոթերիկներից։</dt>
<dd>
Բոլորը գիտեն <code class="prettyprint">ok</code>, <code class="prettyprint">err</code> կամ <code class="prettyprint">defn</code>-ի 
մասին, իսկ <code class="prettyprint">sfri</code> այդքան տարածված չէ։
</dd>
<dt>Մի վերաօգտագործիր անունները այլ կիրառությունների համար։</dt>
<dd>Օգտագործեք <code class="prettyprint">val</code>-եր</dd>
<dt>Խուսափիր օգտագործել <code class="prettyprint">`</code>-ը լեզվի հատուկ անունները գերբեռնելու նպատակով։</dt>
<dd><code class="prettyprint">`type`</code>-ի փոխարեն <code class="prettyprint">typ</code></dd>
<dt>Օգտագործեք "ակտիվ" անուններ կողմնակի ազդեցություններ ունեցող գործողությունների համար։</dt>
<dd><code class="prettyprint">user.activate()</code> այլ ոչ <code class="prettyprint">user.setActive()</code></dd>
<dt>Օգտագործիր խոսուն անուններ մեթոդների համար, որոնք արժեք են վերադարձնում։</dt>
<dd><code class="prettyprint">src.isDefined</code> այլ ոչ <code class="prettyprint">src.defined</code></dd>
<dt>Մի նախադասիր getter-ները <code>get</code>-ով։</dt>
<dd>Նախորդ օրինակի պես դա արժեք չի ավելացնում․ <code class="prettyprint">site.count</code> այլ ոչ <code class="prettyprint">site.getCount</code></dd>
<dt>Մի կրկնեք անունները, որոնք արդեն կան package-ում կամ օբյեկտում։</dt>
<dd>Գերադասեք սա՝ :
	<pre class="prettyprint"><code>object User {
  def get(id: Int): Option[User]
}</code></pre> սրան
<pre class="prettyprint"><code>object User {
  def getUser(id: Int): Option[User]
}</code></pre>Այդպիսի անունները ավելորդ են․ <code>User.getUser</code>-ը նաղորդում է նույնքան ինֆորմացիա, որքան <code>User.get</code>-ը։
</dd>
</dl>


### Ներմուծումներ

<dl class="rules">
<dt>Դասավորեք ներմուծումները այբբենական</dt>
<dd>Սա հեշտացնում է նրանց հետ աշխատանքը թե անզեն աջքով և թե ավտոմատացված</dd>
<dt>Օգտագործեք ձևավոր փակագծեր երբ ներմուծում ես մի քանի անուն փաթեթից</dt>
<dd><code class="prettyprint">import com.twitter.concurrent.{Broker, Offer}</code></dd>
<dt>Օգտագործեք wildcards 6-ից ավել անուններ եք ներմուծում</dt>
<dd>e.g.: <code class="prettyprint">import com.twitter.concurrent._</code>
<br />Սակայն մի արեք այսպես կուրորեն․ որոշ փաթեթներ պարունակում են չափից շատ անուններ</dd>
<dt>Հավաքածուներից օգտվելուց սահմանեք անունն ներմուծելով 
<code class="prettyprint">scala.collection.immutable</code> և/կամ <code class="prettyprint">scala.collection.mutable</code></dt>
<dd>Փոփոխվող և չփոփոխվող հավաքածուները պարունակում են կրկնվող անուններ։ 
Նման ձևով անունները սահմանելը բացահայտ է դարձնում ընթերցողի համար, թե հավաքածուի որ տարբերակն է օգտագործվում (օր.՝ <code class="prettyprint">immutable.Map</code>)</dd>
<dt>Մի օգտագործեք հարաբերական ներմուծումներ այլ փաթեթներից</dt>
<dd>Խուսափեք
	<pre class="prettyprint"><code>import com.twitter
import concurrent</code></pre> ի օգուտ <pre class="prettyprint"><code>import com.twitter.concurrent</code></pre></dd>
<dt>Տեղավորեք ներմուծումները ֆայլի սկզբում</dt>
<dd>Այսպես ընթերցողը կկարողանա հղվել ներմուծումներին մեկ տեղում։</dd>
</dl>

### Ձևավոր փակագծեր

Ձևավոր փակագծերը օգտագործվում են բաղադրյալ արտահայտություններ ստեղծելու համար (նրանք նաև ունեն այլ կիրառություն 
"մոդուլների լեզվում"), որտեղ բաղադրյալ արտահայտության արժեքը բաղադրիչ արտահայտություններից վերջինի արժեքն է։
Խուսափեք ձևավոր փակագծերից պարզ արտահայտությունների դեպքում․ գրեք՝

<pre class="prettyprint"><code class="prettyprint">def square(x: Int) = x * x</code></pre>
	
.LP բայց ոչ

<pre class="prettyprint"><code>def square(x: Int) = {
  x * x
}</code></pre>
	
.LP չնայած կարող է ցանկություն առաջանալ տարանջատել մեթոդի մարմինը քերականապես։ Առաջին տարբերակը ավելի քիչ աղմկոտ է և հեշտ ընթեռնելի։ <em>Խուսափեք քերականական արարողություններից</em> եթե նրանք միտքը չեն պարզեցնում։

### Նմանեցում

Օգտագործեք Նմանեցումը անմիջապես ֆունկցիայի սահմանման մեջ։ Սրա փոխարեն

<pre class="prettyprint"><code>list map { item =>
	item match {
		case Some(x) => x
		case None => default
	}
}
</code></pre>

.LP դուրս բերեք նմանեցումը

<pre class="prettyprint"><code>list map {
	case Some(x) => x
	case None => default
}
</code></pre>

.LP ակնհայտ է որ նմանեցվում են ցուցակի տարրերը &mdash; հղման հերթական բացահայտ շերտը նոր բան չի պատմում։

### Մեկնաբանություններ

API նկարագրությունը տրամադրելու հարցում օգտվեք [ScalaDoc](https://wiki.scala-lang.org/display/SW/Scaladoc)-ից։
Օգտագործեք հետևյալ ոճը․

<pre class="prettyprint"><code>/**
	* ServiceBuilder builds services 
	* ...
	*/
</code></pre>

.LP այլ <em>ոչ</em> դասական ScalaDoc ոճը:

<pre class="prettyprint"><code>/** ServiceBuilder builds services
	* ...
	*/
</code></pre>

Մի օգտագործեք ASCII արվեստ կամ այլ տեսողական զարդարանքներ. Նկարագրեք
API-ները և մի արեք կոդի անտեղի մեկնաբանություններ։ Եթե դուք նկատում եք որ 
կարիք կա մեկնաբանել թե ինչպես է կոդը աշխատում, նախ հասկացեք հանարավո՞ր է արդյոք
այն ձևափոխել այնպես որ այն դառնա ավելի խոսուն։ Գերադասեք
"Միանշանակ սա աշխատելու է"-ն "Փաստացի սա աշխատում է"-ին (Ներողություն [Hoare](https://en.wikipedia.org/wiki/Tony_Hoare)).

## Հստակ և համադասող տիպեր

Տիպերի համակարգի առաջնային խնդիրը ծրագրում սխալներ գտելն է։ Տիպերի համակարգը հնարավոր
է դարձնում է ստատիկ ստուգման ևս մի եղանակ, թույլ տալով մեզ նշել որոշակի դրույթներ մեր կոդի 
մասին, որոնք կոմպիլյատորը կկարողանա ստուգել։ Տիպերի համակարգերը ունեն նաև այլ լավ կողմեր 
բայց սխալների ստուգումը նրանց գոյության հիմնական պատճառն է։

Տիպերի համակարգի մեր կիրառությունը պետք է արտացոլի այդ փաստը, բայց նաև պետք է հիշել 
ընթերցողի մասին․ տիպերի խելամիտ կիրառությունը նպաստում է կոդի պարզությանը, իսկ անտեղի
"խելացիությունը" կոդը բարդացնում է։

Scala-ի հզոր տիպերի համակարգը ակադեմիական փորձարկումների հայտնի աղբյուր է, 
(օր․՝ [Type level programming in Scala](https://apocalisp.wordpress.com/2010/06/08/type-level-programming-in-scala/)).
Լինելով հրաշալի ակադեմիական նյութ, այս մոտեցումները հազվադեպ են գտնում կիրառություն "աշխատանքային" կոդում։
Նրանցից հարկավոր է խուսափել։ 

### Վերադարձի տիպի անոտացիաներ

Չնայած որ Scala-ն թույլ է տալիս սրանք չնշել, նման անոտացիաները հադիսանում են լավ նկարագրություն․
սա հատկապես կարևոր է "բաց" մեթոդների համար։ Այն դեպքերում երբ մեթոդը "փակ" է և նրա վերադարձի տիպը
ակնհայտ է - նման անոտացիայի կարիք չկա։ 

Սա հատկապես կարևոր է [խառնուրդ](https://en.wikipedia.org/wiki/Mixin) տիպի օբյեկտների հետ
աշխատանքի ժամանակ, քանի որ Scala-ն նման դեպքերում ստեղծում է հատուկ եզակի տիպեր։
Ստորև բերված օրինակում `make` մեթոդի վերադարձի տիպը <code class="prettyprint">Service</code> <em>չէ</em>․ կոմպիլյատորը այս դեպքում
ստեղծում է հատուկ տիպ՝ <code class="prettyprint">Object with Service{def getId: Int}</code>

<pre class="prettyprint"><code>trait Service

def make() = new Service {
	def getId = 123
}
</code></pre>

.LP Փոխարենը բացահայտ նշեք տիպը․

<pre class="prettyprint"><code>def make(): Service = new Service{}</code></pre>

Այժմ հեղինակը կարող է հանգիստ գործածել հավելյալ "[հատկանիշներ](https://en.wikipedia.org/wiki/Trait_(computer_programming))" առանց `make`-ի վերադարձի
տիպը փոփոխելու՝ հեշտացնելով հետհամատեղելիությունը։

### Վարիատիվություն

Վարիատիվությունը ի հայտ է գալիս երբ generic-ները օգտագործվում են ենթատիպերի հետ։ Վարիատիվությունը սահմանում է
թե ինչպես են "պարունակվող" տիպի ենթատիպերը հարաբերվում "պարունակող" տիպի ենթատիպերի հետ։
Քանի որ Scala-ն տրամադրում է բառեր տիպերը հայտարարելու պահին նաև սահմանել վարիատիվությունը,
ընդհանուր գրադարանների (հատկապես հավաքածուների գրադարանների) հեղինակները պետք լավ տիրապետեն այդ *լեզվին։ 
Նման սահմանումները կարևոր են համոգտագործվող կոդի պիտանելիության տեսանկյունից, սակայն նրանց սխալ կիրառությունը
կարող է վտանգավոր լինել։

Ինվարիանտները Scala-ի տիպերի համակարգի ավելի նեղ բայց անհրաժեշտ ասպեկտներից են
և պետք է լայնորեն (և ճիշտ) կիրառվեն, քանի որ նրանք օգնում են տիպերի ժառանգման գործընթացին։

*Անփոփոխ հավաքածուները պիտի լինեն կովարիանտ*։ Մեթոդները՝ որոնք ստանում են 
պարունակվող տիպը պիտի համապատասխան "իջեցնեն" հավաքածուի տիպը․

<pre class="prettyprint"><code>trait Collection[+T] {
	def add[U >: T](other: U): Collection[U]
}</code></pre>

*Փոփոխվող հավաքածուները պիտի լինեն ինվարիանտ*։ Կովարիանտությունը
հիմանակնում սխալ է աշխատում փոփոխվող հավաքածուների հետ։ Դիցուք ունենք

<pre class="prettyprint"><code>trait HashSet[+T] {
	def add[U >: T](item: U)
}</code></pre>

.LP և հետևյալ տիպերի and the following type հիերարխիան․

<pre class="prettyprint"><code>trait Mammal
trait Dog extends Mammal
trait Cat extends Mammal
</code></pre>

.LP Եթե հոտևյալ շների <code class="prettyprint">HashSet</code>-ի հետ

<pre class="prettyprint"><code>val dogs: HashSet[Dog]</code></pre>

.LP վարվենք ինչպես կաթնասունների <code class="prettyprint">HashSet</code> և ավելացնենք կատու

<pre class="prettyprint"><code>val mammals: HashSet[Mammal] = dogs
mammals.add(new Cat{})</code></pre>

.LP այն այլևս շների <code class="prettyprint">HashSet</code> չի լինի!

<!--
  *	when to use abstract type members?
  *	show contravariance trick?
-->

### Հոմանիշ տիպեր

Հայտարարեք հոմանիշ տիպեր եթե նրանք խթանում են պատշաճ անվանումներ կամ պարզաբանում են նպատակը,
բայց ոչ երբ սկզբնական տիպը ինքնաբացատրական է։

<pre class="prettyprint"><code>() => Int</code></pre>

.LP ավելի պարզ է քան

<pre class="prettyprint"><code>type IntMaker = () => Int
IntMaker
</code></pre>

.LP քանի որ այն և կարճ է և օգտագործում է հասարակ տիպ։ Սակայն

<pre class="prettyprint"><code>class ConcurrentPool[K, V] {
	type Queue = ConcurrentLinkedQueue[V]
	type Map   = ConcurrentHashMap[K, Queue]
	...
}
</code></pre>

.LP օգտակար է քանի որ այն պարզաբանում է նպատակը և խրախուսում է հակիրճությունը։

Մի ստեղծեք ենթատիպեր որտեղ հոմանիշները բավարար են։

<pre class="prettyprint"><code>trait SocketFactory extends (SocketAddress => Socket)</code></pre>
	
.LP <code class="prettyprint">SocketFactory</code>-ն ֆունկցիա է որը ստեղծում է <code class="prettyprint">Socket</code>. Այս դեպքերում նպատակահարմար է օգտագործել տիպի հոմանիշներ։

<pre class="prettyprint"><code>type SocketFactory = SocketAddress => Socket</code></pre>

Այժմ մենք կարող ենք սահմանել անվանական ֆունկցիաներ <code class="prettyprint">SocketFactory</code> տիպի արժեքների համար, ինչպես նաև կիրառել
ֆունկցիաների շարադրում։

<pre class="prettyprint"><code>val addrToInet: SocketAddress => Long
val inetToSocket: Long => Socket

val factory: SocketFactory = addrToInet andThen inetToSocket
</code></pre>

Տիպերի հոմանիշները կցված են վերին մակարդակի անուններին փաթեթի օբյեկտների միջոցով․

<pre class="prettyprint"><code>package com.twitter
package object net {
	type SocketFactory = (SocketAddress) => Socket
}
</code></pre>

Նկատեք որ տիպերի հոմանիշները նոր տիպեր չեն - նրանք համարժեք են և քերականապես փոխարինվում են իրենց հիմքում ընկած տիպերի անվանումներով։

### Implicit-ներ

Implicit-ները տիպերի համակարգի հզոր հատկություն են, սակայն չպիտի հաճախ օգտագործվեն։
Նրանք ունեն որոշման բարդ կանոններ և դժվար է հասկանալ թե ինչ է իրականում կատարվում
կոդը բառացի ուսումնասիրելով։ Վստահ կարելի է նրանցից օգտվել հետևյալ դեպքերում․

* Scala-ի ոճով գրադարան ընդլայնելուց կամ ստեղծելուց
* Օբյեկտ ընդլայնելուց կամ ձևափոխելուց ("pimp my library" կաղապար)
* Ապացույներ պահանջող տիպային սահմաններ սահմանելուց (թարգ․ նշ․ տես [Generalized type constraints](https://herringtondarkholme.github.io/2014/09/30/scala-operator/))
* Տիպային ապացույց տրամադրելուց (typeclassing) (թարգ․ նշ․ տես [Typeclass](https://tpolecat.github.io/2013/10/12/typeclass.html))
* `Manifest`-ների հետ (թարգ․ նշ․ տես [TypeTag](https://docs.scala-lang.org/overviews/reflection/typetags-manifests.html))

Եթե նկատում եք որ օգտագործում եք implicit-ներ, կանգ առեք և հարցրեք ձեզ, չկա արդյոք
խնդրի լուծման այլ եղանակ։

Մի օգտագործեք implicit-ները նման տիպերի ավտոմատ փոխակերպումների համար (օր․՝ ցուցակները 
հոսքերի): Նման բաները հարկ է անել բացահայտ զի այդ տիպերը ունեն տարբեր սեմանտիկա և 
ընթերցողը պետք է տեղյակ լինի այդ մասին։

## Հավաքածուներ

Սկալան ունի շատ ընդհանրացված, հարուստ, հղոր և համադրվող հավաքածուների գրադարան․ 
գրադարանները բարձր մակարդակի են և տրամադրում են բազում գործողություններ։ Նրանց շնորհիվ 
հավաքածուների հետ շատ մանիպուլյացիաներ և ձևափոխություններ հնարավոր է իրականացնել համառոտ և ընթռնելի սակայն նրանց թեթևամիտ կիրառումը հաճախ հակառակ արդյունք ունենալ։ Ամեն Scala ծրագրավորող պետք է կարդա [collections design
document](https://www.scala-lang.org/docu/files/collections-api/collections.html)․ 
սա հանգամանորեն լուսաբանում և հիմնավորում է Scala-ի հավաքածուների գրադարանը։

Միշտ օգտագործեք ձեր պահանջներին բավարարող ամենապարզ հավաքածուն։

### Հիերարխիա

Հավաքածուների գրադարանը մեծ է։ Բացի բարդ հիերարխիայից, որի հիմքը `Traversable[T]`-ն է,
կան հավաքածուների չփոփոխվող(`immutable`) և փոփոխվող(`mutable`) տարբերակներ։ Ստորև բերված սխեման այնուամենայնիվ բնութագրում է երկու հիերարխիաների կառուցվածքը։

<img src="coll.png" style="margin-left: 3em;" />

.LP <code class="prettyprint">Iterable[T]</code>-ն ցանկացած հավաքածու է որի վրայով հնարավոր է "քայլել" (iterated)։ Այդպիսինները տրամադրում են իտերատոր, հետևաբար նաև <code class="prettyprint">foreach</code>). <code class="prettyprint">Seq[T]</code>-ները <em>կարգավորված</em> հավաքածուներ են, <code class="prettyprint">Set[T]</code>-ները մաթեմաթիկական բազմություններ են (չկրկնվող էլեմենտների չկարգավորված հավաքածուներ), իսկ <code class="prettyprint">Map[T]</code>-ները ասոցիատիվ զանգվածներ են, նույնպես չկարգավորված։

### Կիրառություն

*Գերադասեք չփոփոխվող հավաքածուները։* Նրանք կիրառելի են դեպքերի մեծամասնությունում և հեշտացնում են ծրագրի մասին դատողություններ անելը, որովհետև նույնն են անկաղ նրանց հղման կետից, (referentially transparent) և հետևաբար լռելյայն անվտանգ հոսքերի պարագայում (threadsafe):

*Բացահատ օգտագործեք `mutable` անվանացանկի աղտոտումով, խմբավորեք արտահայտությունները -ին։

<pre -ովclass="prettyprint"><code>	import scala.collection.mutable
	val set = mutable.Set()
</code></pre>

.LP Սա բացահայտ է դարձնում որ օգտագործվում է փոփոխվող տարբերակը։

*Օգտագործեք հավաքածուի դասի լռեյայն կոնստրուկտորը։* Երբ կարգավորված շարքի կարիք ունեք, (նույնիկ եթե ոչ կապակցված), օգտագործեք `Seq()` կոնստրուկտորը, և այլն:

<pre class="prettyprint"><code>	val seq = Seq(1, 2, 3)
	val set = Set(1, 2, 3)
	val map = Map(1 -> "one", 2 -> "two", 3 -> "three")
</code></pre>

.LP Այս ոճը անջատում է հավաքածուի սեմանտիկան իրագործումից, թույլ տալով գրադարանին ընտրել ամենահարմարը․ ձեզ հարկավոր է <code class="prettyprint">Map</code>, ոչ պարտադիր Red-Black Tree. Ավելին, այս լռելյայն կոնստրուկտորները հաճախ օգտագործում են հատուկ հարմարեցված ներկայացումներ․ օրինակ, <code class="prettyprint">Map()</code>-ը օգտագործում է երեք դաշտ պարունակող օբյեկտ, երեք բանալի պարունակող <code class="prettyprint">Map</code>-երի համար։

Եզրակացությունը հետևյալն է։ ձեր մեթոդներում և կոնստրուկտորներում *ընդունեք հավաքածուի հնարավոր ամենաընդհանուր տիպը*. Այն հիմնականում սրանցից մեկն է․ `Iterable`, `Seq`, `Set`, կամ `Map`։ Եթե ձեր մեթոդը կարիք ունի հաջորդականության, օգտագործեք `Seq[T]`, ոչ `List[T]`: (Նախազգուշացում․ `Traversable`, `Iterable` և `Seq` տիպերը, որոնք սահմանված են `scala.package`-ում, `scala.collection`-ից են, այսինքն՝ փոփոխվող տիպի են, իսկ `Map`-ը և `Set`-ը, որոնք սահմանված են `Predef.scala`-ում, `scala.collection.immutable`-ից են, այսինքն՝ չփոփոխվող են։. Սա նշանակում է, որ օրինակ լռելյայն `Seq` տիպը կարող է լինել թե փոփոխվող, թե չփոփոխվող։ Հետևաբար եթե ձեր մեթոդը ակնկալում է չփոփոխվող հավաքածու և դուք օգտագործում եք `Traversable`, `Iterable` կամ `Seq`, դուք *պիտի* հատուկ պահանջեք կամ ներմուծեք չփոփոխվող տարբերակը։ Հակառակ դեպքում որևէ մեկը *կարող* է փոխանցել փոփոխվող տարբերակը։)

<!--
something about buffers for construction?
anything about streams?
-->

### Ոճ

Ֆունցիոնալ ծրագրավորումը խրախուսում է իրար հաջորդող հաղորդակցված ձևափոխությունների կիրառումը չփոփոխվող հավաքածուների ձևավորման համար։ Սա հաճախ բերում է շատ համառոտ լուծումների, բայց և կարող է շփոթեցնել ընթերցողին երբ դժվար է հետևել հեղինակի մտքին կամ հաշվի առնել բոլոր ենթադրյալ միջանկյալ արդյունքները։ Օրինակ երբ մենք ցանկանում ենք խմբավորել տարբեր ծրագրավորման լեզուների օգտին քվեները (*լեզու*, *քվեներ*) հաջորդականությունից, դասավորելով նրանց ըստ քվեների նվազման։ Մենք կարող ենք գրել․
	
<pre class="prettyprint"><code>	val votes = Seq(("scala", 1), ("java", 4), ("scala", 10), ("scala", 1), ("python", 10))
	val orderedVotes = votes
	  .groupBy(_._1)
	  .map { case (which, counts) => 
	    (which, counts.foldLeft(0)(_ + _._2))
	  }.toSeq
	  .sortBy(_._2)
	  .reverse
</code></pre>

.LP Սա և համառոտ է և ճիշտ, սակայն համարյա ամեն ընթերցող չարչարվելու է հեղինակի բուն միտքը վերակառուցելիս։ Նման խնդիրները լուծվում են <em>հայտարարելով միջանկյալ արդյունքներն ու պարամետրերը</em>:

<pre class="prettyprint"><code>	val votesByLang = votes groupBy { case (lang, _) => lang }
	val sumByLang = votesByLang map { case (lang, counts) =>
	  val countsOnly = counts map { case (_, count) => count }
	  (lang, countsOnly.sum)
	}
	val orderedVotes = sumByLang.toSeq
	  .sortBy { case (_, count) => count }
	  .reverse
</code></pre>

.LP Կոդը նամարյա նույնքան համառոտ է բայց ավելի լավ է արտահայտում երկու ձևափոխությունները (հայտարարված միջանկյալ արդյունքներ) և ձևափոխվող տվյալի կառուցվածքը (հայտարարված պարամետրեր)։ Եթե անհանգստացած եք անվանացանկի աղտոտումով, խմբավորեք արտահայտությունները <code>{}</code>-ով:

<pre class="prettyprint"><code>	val orderedVotes = {
	  val votesByLang = ...
	  ...
	}
</code></pre>

### Արտադրողականություն

Բարձր մակարդակի հավաքածուների գրադարանները (և բարձր մակարդակի 
կառույցներն ընդհանրապես) բարդացնում են արտադրողականության մասին 
դատողությունները․ որքան հեռանում ենք "ամնիջապես" համակրգչին հրահանգներ 
տալուց, այն է՝ իմպերատիվ ոճից, այնքան ավելի բարդ է լինում հստակ 
գնահատել կոդի արտադրողականությունը։ Սակայն ճշտության մասին դատելը 
սովորաբար հեշտանում է, շահում է նաև ընթեռնելիությունը։ Scala-ի դեպքում 
ամենն ավելի է բարդանում, հաշվի առնելով հիմքում ընկած Java-ի միջավայրը։
Scala-ն թաքցնում է կաղսապարման/ապակաղապարման(boxing/unboxing) 
գործողությունները, որոնք կարող են առաջացնել արտադրողականության զգալի տույժեր։

Նախքան ցածր մակարդակի մանրամասներին անդրադառնալը, համոզվեք որ օգտվում եք ձեր 
խնդրին համապատասխան հավաքածուից։ Համոզվեք որ ձեր ընտրած տվյասլների կառույցը չունի
անսպասելի ասիմպտոտիկ բարդություն։ Scala-իտարբեր հավաքածուների բարդությունները նկարագրված 
են [այստեղ](https://www.scala-lang.org/docu/files/collections-api/collections_40.html).

Արտադրողականության օպտիմիզացիայի առաջին կանոնը հասկանալն է, թե *ինչու* է ձեր 
ծրագիրը դանդաղ։ Մի գործեք առանց հստակ փաստերի. չափեք (profile) ձեր ծրագիրը նախքան 
օպտիմիզացիան սկսելը (լավ չափագոծիք (profiler) է [Yourkit](https://www.yourkit.com/)-ը)։
Նախ կենտրոնացեք ցիկլերի և մեծ տվյալների կառույցների վրա։ Չափազանց կենտրոնացումը 
օպտիմիզացիայի վրա սովորաբար ապարդյուն ջանք է։ Հիշեք Դոնալդ Կնուտի սկզբունքը․ "Վաղաժամ 
օպտիմիզացիան ամեն չարիքների հիմքն է"։

<!-- 
referentially transparent 
 -->

Հաճախ տեղին է օգտագործել ցածր մակարդակի հավաքածուներ այն դեպքերում, երբ հարկավոր է 
բարձր արտադրողականություն կամ հիշողության էֆեկտիվ օգտագործում։ Օգտագործեք զանգվածներ 
ցուցակների փոխարեն երկար հաջորդականությունների դեպքում (չփոփոխվող `Vector`
հավաքածուն տրամադրում է զանգվածների referentially transparent միջերես) և բուֆերներ 
հաջորդականությունների անմիջական կառուցման փոխարեն երբ արտադրողականությունը կարևոր է։

### Java հավաքածուներ

Օգտագործեք `scala.collection.JavaConverters` Java-ի հավաքածուների հետ աշխատելու համար։
Սրանք implicit-ներ են որոնք ավելացնում են `asJava` և `asScala` վերափոխման մեթոդմերը, 
որոնք բացահայտ են դարձնում վերափոխումները և օգնում ընթերցողին։

<pre class="prettyprint"><code>	import scala.collection.JavaConverters._
	
	val list: java.util.List[Int] = Seq(1,2,3,4).asJava
	val buffer: scala.collection.mutable.Buffer[Int] = list.asScala
</code></pre>

## Հերթագայություն (Concurrency)

Ժամանակակից վեբ ծառայությունները բավականին ծանրաբեռնված են -- սեռվեռնեռրի համար սովորական
է դարձել տասնյակ կամ նույնիսկ հարյուր հազարավոր միաժամանակ հարցումներ համակարգելը -- և դրա հետևանքների կառավարումը կայուն համակարգ ստանալու գրավականներից մեկն է։

*Հոսքերը* հերթագայությունը արտահայտելու միջոց են։ Նրանք ապահովում են անկախ, հիփից (տես. [heap](https://en.wikipedia.org/wiki/Memory_management#HEAP)) օգտվող կատարման կոնտեքստներ, որոնց գործարկումը պլանավորվում է օպերացիոն համակարգի կողմից։ Հոսքեր ստեղծելը, սակայն, թանկ է Java-ի դեպքում և նրանք անմիջական կառավարման կարիք ունեն, սովորաբար պարկերի (pool) միջոցով։ Սա առաջացնում է հավելյալ բարդություններ ծրագրավորողի համար և խթանում է սերտաճը, քանի որ դժվար է բաժանել ծրագրի տրամաբանությունը՝ օգտագործվող ռեսուրսներից։

Կառավարման բարդությունը ավելի ակներև է ելքային հարցումների բարձր աստիճան ունեցող համակարգերի դեպքում, երբ ամեն մուտքային հարցում վերածվում է մի քանի ելքային հարցուման համակարգի տարբեր շերտերին։ Նման համակարգերում հոսքերի պարկերը պետք է կառավարվեն ըստ շերտերում հարցումների քանակների հարաբերության․ պարկերից մեկի վատ կառավարումը արտահայտվելու է մնացած պարկերում։

Կայուն համակարգերը նաև հաշվի են առնում լռությունն ու չեղարկումը, որոնցից յուրաքանչյուրը պահանջում են հավելյալ "կառավարող" հեսքեր, կառավարման խնդիրն ավելի խորացնելով։ Հարկ է նշել, որ նման կառավարման խնդիր ընդհանարապես չէր լինի եթե հոսքերը թանկ ռեսուրս չլինեին․ հարկավոր չէին լինի հոսքերի պարկեր, իսկ չեղարկված կամ լուռ ռեսուրսները ուղղակի կանտեսվեին։ 

Այսպիսով՝ ռեսուրսների կառավարումը վնասում է մոդուլյարությանը

### Future-ներ

Հերթագայությունը կառավարելու համար օգտագործեք `Future`-ներ։ Նրանք օգնում են անջատել գործողությունների հերթագայման տրամաբանությունը ռեսուրսների կառավարումից․ օր․՝ [Finagle][Finagle]-ը էֆեկտիվորեն բաշխում է իրարից անկախ գործողությունները մի քանի հոսքերի վրա. Scala-ն ունի անանուն ֆունկցիաների հայտարարման հարմար գրելաձև, այդ պատճառով `Futures`-ները քերականապես շատ չեն բարդեցնում կոդը և դառնում են շատ ծևագրավորողների երկրորդ ես-ը։

`Future`-ները թույլ են տալիս ծրագրավորողին արտահայտել հերթագայությունը դեկլարատիվ ոճով և շղթայել այդ քայլերը։ Նրանք նաև տրամադրում են խափանման դեպքերի մեկնաբանման հստակ ձև։ Այս հատկությունները մեզ ապացուցեցին, որ նրանք հարմար են հատկապես ֆունկցիոնալ ծրագրավորման լեզուներում, ուր նման մոտեցումները խրախուսվող ոճի մաս են։

*Գերադասեք շղթայել և ձևափոխել գոյություն ունեցող `futures`-ները նորերը ստեղծելուց։* `Futures`-ների հետ նման աշխատանքը ապահովում է համակարգում սխալների և չեղարկումների մասին փաստը հասանելի դարձնել բոլոր օղակներին և ազատում են ծրագրավորողին `Java`-ի հիշողության մոդելի մասին մտածելուց։ Նույնիսկ փորձառու ծրագրավորողը կարող է գրել հետևյալ կոդը 10 անգամ `RPC` արձակելու և վերջում արդյունքը տպելու համար։

<pre class="prettyprint"><code>val p = new Promise[List[Result]]
var results: List[Result] = Nil
def collect() {
	doRpc() onSuccess { result =>
		results = result :: results
		if (results.length < 10)
			collect()
		else
			p.setValue(results)
	} onFailure { t =>
		p.setException(t)
	}
}

collect()
p onSuccess { results =>
	printf("Got results %s\n", results.mkString(", "))
}
</code></pre>

Սխալների տեսանելիությունը ապահովելու համար ծրագրավորողը ստիպված էր կոդում բացահայտ սահմանել ճյուղավորումը։ Էլ ավելի վատ խնդիր - այս կոդը սխա՛լ է։
`results`-ը `volatile` չհայտարարելու դեպքում մենք չենք կարող վստահ լինել, որ `results`-ը պարունակում է նախորդ քալյի արժեքը ամեն քայլում։ `Java`-ի հիշողության մոդելը խառը կենդանի (subtle beast) է։ Բարեբախտաբար այս ամենից հնարավոր է խուսափել կիրառելով դեկլարատիվ ոճը․

<pre class="prettyprint"><code>def collect(results: List[Result] = Nil): Future[List[Result]] =
	doRpc() flatMap { result =>
		if (results.length < 9)
			collect(result :: results)
		else
			Future.value(result :: results)
	}

collect() onSuccess { results =>
	printf("Got results %s\n", results.mkString(", "))
}
</code></pre>

Օգտագործեք `flatMap`-ը գործողություններ շղթայելու և արդյունքը "հավաքելու" համար։ Սա տարածված ֆունլցիոնալ ծրագրավորման մոտեցում է, կիրառված `Future`-ների վրա։ Այն ավելի ճիշտ է, պահանջում է ավելի քիչ նախապատրաստում և ավելի ընթեռնելի է։

*Օգտագործեք `Future`-ների կոմբինատորներ*. `Future.select`-ը, `Future.join`-ը, և `Future.collect`-ը արտահայտում են հիմնական գործողությունները, երբ գործ ունեք մի քանի `Future`-ների հետ, որոնք պետք է փոխկապակցվեն։

*Մի արձակեք սեփական բացառությունները մեթոդներից, որոնք վերադարձնում են `Future`-ներ*
`Future`-ները ներկայացնում են գործողության թե հաջող, թե անհաջող ավարտները։ Այդ պատճառով կարևոր է, որ գործողության ընթացքում առաջացած խնդիրները պարունակվեն վերադարձվող `Future`-ում։ Կարճ ասած վերադարձրեք <code>Future.exception</code>, այդ բացառությունը արձակելու փոխարեն։

<pre class="prettyprint"><code>def divide(x: Int, y: Int): Future[Result] = {
	if (y == 0)
		return Future.exception(new IllegalArgumentException("Divisor is 0"))

	Future.value(x/y)
}
</code></pre>

Անվերականգնելի բացառությունները չպետք է արտահայտվեն `Futures`-ներում։ Այս բացառություններ են օրինակ ռեսուրսների պակասը, օր․՝ `OutOfMemoryError`-ը, կամ `JVM` մակարդակի խնդիրները, օր․՝ `NoSuchMethodError`-ը, երբ հարկավոր է `JVM`-ը անջատել։

Որպես `Future.exception` վերադարձվող բացառությունները ճանաչելու համար հարկ է օգտագործել <code>scala.util.control.NonFatal</code> պրեդիկատը։

### Collections

The subject of concurrent collections is fraught with opinions,
subtleties, dogma and FUD. In most practical situations they are a
nonissue: Always start with the simplest, most boring, and most
standard collection that serves the purpose. Don't reach for a
concurrent collection before you *know* that a synchronized one won't
do: the JVM has sophisticated machinery to make synchronization cheap,
so their efficacy may surprise you.

If an immutable collection will do, use it -- they are referentially
transparent, so reasoning about them in a concurrent context is
simple. Mutations in immutable collections are typically handled by
updating a reference to the current value (in a `var` cell or an
`AtomicReference`). Care must be taken to apply these correctly:
atomics must be retried, and `vars` must be declared volatile in order
for them to be published to other threads.

Mutable concurrent collections have complicated semantics, and make
use of subtler aspects of the Java memory model, so make sure you
understand the implications -- especially with respect to publishing
updates -- before you use them. Synchronized collections also compose
better: operations like `getOrElseUpdate` cannot be implemented
correctly by concurrent collections, and creating composite
collections is especially error prone.

<!--

use the stupid collections first, get fancy only when justified.

serialized? synchronized?

blah blah.

Async*?

-->


## Control structures

Programs in the functional style tend to require fewer traditional
control structures, and read better when written in the declarative
style. This typically implies breaking your logic up into several
small methods or functions, and gluing them together with `match`
expressions. Functional programs also tend to be more
expression-oriented: branches of conditionals compute values of
the same type, `for (..) yield` computes comprehensions, and recursion
is commonplace.

### Recursion

*Phrasing your problem in recursive terms often simplifies it,* and if
the tail call optimization applies (which can be checked by the `@tailrec`
annotation), the compiler will even translate your code into a regular loop.

Consider a fairly standard imperative version of heap <span
class="algo">fix-down</span>:

	def fixDown(heap: Array[T], m: Int, n: Int): Unit = {
	  var k: Int = m
	  while (n >= 2*k) {
	    var j = 2*k
	    if (j < n && heap(j) < heap(j + 1))
	      j += 1
	    if (heap(k) >= heap(j))
	      return
	    else {
	      swap(heap, k, j)
	      k = j
	    }
	  }
	}

Every time the while loop is entered, we're working with state dirtied
by the previous iteration. The value of each variable is a function of
which branches were taken, and it returns in the middle of the loop
when the correct position was found (The keen reader will find similar
arguments in Dijkstra's ["Go To Statement Considered Harmful"](http://www.u.arizona.edu/~rubinson/copyright_violations/Go_To_Considered_Harmful.html)).

Consider a (tail) recursive
implementation^[From [Finagle's heap
balancer](https://github.com/twitter/finagle/blob/master/finagle-core/src/main/scala/com/twitter/finagle/loadbalancer/Heap.scala#L41)]:

	@tailrec
	final def fixDown(heap: Array[T], i: Int, j: Int) {
	  if (j < i*2) return
	
	  val m = if (j == i*2 || heap(2*i) < heap(2*i+1)) 2*i else 2*i + 1
	  if (heap(m) < heap(i)) {
	    swap(heap, i, m)
	    fixDown(heap, m, j)
	  }
	}

.LP here every iteration starts with a well-defined <em>clean slate</em>, and there are no reference cells: invariants abound. It&rsquo;s much easier to reason about, and easier to read as well. There is also no performance penalty: since the method is tail-recursive, the compiler translates this into a standard imperative loop.

<!--
elaborate..
-->


### Returns

This is not to say that imperative structures are not also valuable.
In many cases they are well suited to terminate computation early
instead of having conditional branches for every possible point of
termination: indeed in the above `fixDown`, a `return` is used to
terminate early if we're at the end of the heap.

Returns can be used to cut down on branching and establish invariants.
This helps the reader by reducing nesting (how did I get here?) and
making it easier to reason about the correctness of subsequent code
(the array cannot be accessed out of bounds after this point). This is
especially useful in "guard" clauses:

	def compare(a: AnyRef, b: AnyRef): Int = {
	  if (a eq b)
	    return 0
	
	  val d = System.identityHashCode(a) compare System.identityHashCode(b)
	  if (d != 0)
	    return d
	    
	  // slow path..
	}

Use `return`s to clarify and enhance readability, but not as you would
in an imperative language; avoid using them to return the results of a
computation. Instead of

	def suffix(i: Int) = {
	  if      (i == 1) return "st"
	  else if (i == 2) return "nd"
	  else if (i == 3) return "rd"
	  else             return "th"
	}

.LP prefer:

	def suffix(i: Int) =
	  if      (i == 1) "st"
	  else if (i == 2) "nd"
	  else if (i == 3) "rd"
	  else             "th"

.LP but using a <code>match</code> expression is superior to either:

	def suffix(i: Int) = i match {
	  case 1 => "st"
	  case 2 => "nd"
	  case 3 => "rd"
	  case _ => "th"
	}

Note that returns can have hidden costs: when used inside of a closure,

	seq foreach { elem =>
	  if (elem.isLast)
	    return
	  
	  // process...
	}
	
.LP this is implemented in bytecode as an exception catching/throwing pair which, used in hot code, has performance implications.

### `for` loops and comprehensions

`for` provides both succinct and natural expression for looping and
aggregation. It is especially useful when flattening many sequences.
The syntax of `for` belies the underlying mechanism as it allocates
and dispatches closures. This can lead to both unexpected costs and
semantics; for example

	for (item <- container) {
	  if (item != 2) return
	}

.LP may cause a runtime error if the container delays computation, making the <code>return</code> nonlocal!

For these reasons, it is often preferrable to call `foreach`,
`flatMap`, `map`, and `filter` directly -- but do use `for`s when they
clarify.

### `require` and `assert`

`require` and `assert` both serve as executable documentation. Both are
useful for situations in which the type system cannot express the required
invariants. `assert` is used for *invariants* that the code assumes (either
internal or external), for example

	val stream = getClass.getResourceAsStream("someclassdata")
	assert(stream != null)

Whereas `require` is used to express API contracts:

	def fib(n: Int) = {
	  require(n > 0)
	  ...
	}

## Functional programming

*Value oriented* programming confers many advantages, especially when
used in conjunction with functional programming constructs. This style
emphasizes the transformation of values over stateful mutation,
yielding code that is referentially transparent, providing stronger
invariants and thus also easier to reason about. Case classes, pattern
matching, destructuring bindings, type inference, and lightweight
closure- and method-creation syntax are the tools of this trade.

### Case classes as algebraic data types

Case classes encode ADTs: they are useful for modelling a large number
of data structures and provide for succinct code with strong
invariants, especially when used in conjunction with pattern matching.
The pattern matcher implements exhaustivity analysis providing even
stronger static guarantees.

Use the following pattern when encoding ADTs with case classes:

	sealed trait Tree[T]
	case class Node[T](left: Tree[T], right: Tree[T]) extends Tree[T]
	case class Leaf[T](value: T) extends Tree[T]
	
.LP The type <code>Tree[T]</code> has two constructors: <code>Node</code> and <code>Leaf</code>. Declaring the type <code>sealed</code> allows the compiler to do exhaustivity analysis since constructors cannot be added outside the source file.

Together with pattern matching, such modelling results in code that is
both succinct and "obviously correct":

	def findMin[T <: Ordered[T]](tree: Tree[T]) = tree match {
	  case Node(left, right) => Seq(findMin(left), findMin(right)).min
	  case Leaf(value) => value
	}

While recursive structures like trees constitute classic applications of
ADTs, their domain of usefulness is much larger. Disjoint unions in particular are
readily modelled with ADTs; these occur frequently in state machines.

### Options

The `Option` type is a container that is either empty (`None`) or full
(`Some(value)`). It provides a safe alternative to the use of `null`,
and should be used instead of null whenever possible. Options are 
collections (of at most one item) and they are embellished with 
collection operations -- use them!

Write

	var username: Option[String] = None
	...
	username = Some("foobar")
	
.LP instead of

	var username: String = null
	...
	username = "foobar"
	
.LP since the former is safer: the <code>Option</code> type statically enforces that <code>username</code> must be checked for emptyness.

Conditional execution on an `Option` value should be done with
`foreach`; instead of

	if (opt.isDefined)
	  operate(opt.get)

.LP write

	opt foreach { value =>
	  operate(value)
	}

The style may seem odd, but provides greater safety (we don't call the
exceptional `get`) and brevity. If both branches are taken, use
pattern matching:

	opt match {
	  case Some(value) => operate(value)
	  case None => defaultAction()
	}

.LP but if all that's missing is a default value, use <code>getOrElse</code>

	operate(opt getOrElse defaultValue)
	
Do not overuse  `Option`: if there is a sensible
default -- a [*Null Object*](https://en.wikipedia.org/wiki/Null_Object_pattern) -- use that instead.

`Option` also comes with a handy constructor for wrapping nullable values:

	Option(getClass.getResourceAsStream("foo"))
	
.LP is an <code>Option[InputStream]</code> that assumes a value of <code>None</code> should <code>getResourceAsStream</code> return <code>null</code>.

### Pattern matching

Pattern matches (`x match { ...`) are pervasive in well written Scala
code: they conflate conditional execution, destructuring, and casting
into one construct. Used well they enhance both clarity and safety.

Use pattern matching to implement type switches:

	obj match {
	  case str: String => ...
	  case addr: SocketAddress => ...

Pattern matching works best when also combined with destructuring (for
example if you are matching case classes); instead of

	animal match {
	  case dog: Dog => "dog (%s)".format(dog.breed)
	  case _ => animal.species
	  }

.LP write

	animal match {
	  case Dog(breed) => "dog (%s)".format(breed)
	  case other => other.species
	}

Write [custom extractors](https://docs.scala-lang.org/tour/extractor-objects.html) but only with
a dual constructor (`apply`), otherwise their use may be out of place.

Don't use pattern matching for conditional execution when defaults
make more sense. The collections libraries usually provide methods
that return `Option`s; avoid

	val x = list match {
	  case head :: _ => head
	  case Nil => default
	}

.LP because

	val x = list.headOption getOrElse default

.LP is both shorter and communicates purpose.

### Partial functions

Scala provides syntactical shorthand for defining a `PartialFunction`:

	val pf: PartialFunction[Int, String] = {
	  case i if i%2 == 0 => "even"
	}
	
.LP and they may be composed with <code>orElse</code>

	val tf: (Int => String) = pf orElse { case _ => "odd"}
	
	tf(1) == "odd"
	tf(2) == "even"

Partial functions arise in many situations and are effectively
encoded with `PartialFunction`, for example as arguments to
methods

	trait Publisher[T] {
	  def subscribe(f: PartialFunction[T, Unit])
	}

	val publisher: Publisher[Int] = ...
	publisher.subscribe {
	  case i if isPrime(i) => println("found prime", i)
	  case i if i%2 == 0 => count += 2
	  /* ignore the rest */
	}

.LP or in situations that might otherwise call for returning an <code>Option</code>:

	// Attempt to classify the the throwable for logging.
	type Classifier = Throwable => Option[java.util.logging.Level]

.LP might be better expressed with a <code>PartialFunction</code>

	type Classifier = PartialFunction[Throwable, java.util.Logging.Level]
	
.LP as it affords greater composability:

	val classifier1: Classifier
	val classifier2: Classifier

	val classifier: Classifier = classifier1 orElse classifier2 orElse { case _ => java.util.Logging.Level.FINEST }


### Destructuring bindings

Destructuring value bindings are related to pattern matching; they use the same
mechanism but are applicable when there is exactly one option (lest you accept
the possibility of an exception). Destructuring binds are particularly useful for
tuples and case classes.

	val tuple = ('a', 1)
	val (char, digit) = tuple
	
	val tweet = Tweet("just tweeting", Time.now)
	val Tweet(text, timestamp) = tweet

### Laziness

Fields in scala are computed *by need* when `val` is prefixed with
`lazy`. Because fields and methods are equivalent in Scala (lest the fields
are `private[this]`)

	lazy val field = computation()

.LP is (roughly) short-hand for

	var _theField = None
	def field = if (_theField.isDefined) _theField.get else {
	  _theField = Some(computation())
	  _theField.get
	}

.LP i.e., it computes a results and memoizes it. Use lazy fields for this purpose, but avoid using laziness when laziness is required by semantics. In these cases it's better to be explicit since it makes the cost model explicit, and side effects can be controlled more precisely.

Lazy fields are thread safe.

### Call by name

Method parameters may be specified by-name, meaning the parameter is
bound not to a value but to a *computation* that may be repeated. This
feature must be applied with care; a caller expecting by-value
semantics will be surprised. The motivation for this feature is to
construct syntactically natural DSLs -- new control constructs in
particular can be made to look much like native language features.

Only use call-by-name for such control constructs, where it is obvious
to the caller that what is being passed in is a "block" rather than
the result of an unsuspecting computation. Only use call-by-name arguments
in the last position of the last argument list. When using call-by-name,
ensure that the method is named so that it is obvious to the caller that 
its argument is call-by-name.

When you do want a value to be computed multiple times, and especially
when this computation is side effecting, use explicit functions:

	class SSLConnector(mkEngine: () => SSLEngine)
	
.LP The intent remains obvious and the caller is left without surprises.

### `flatMap`

`flatMap` -- the combination of `map` with `flatten` -- deserves special
attention, for it has subtle power and great utility. Like its brethren `map`, it is frequently
available in nontraditional collections such as `Future` and `Option`. Its behavior
is revealed by its signature; for some `Container[A]`

	flatMap[B](f: A => Container[B]): Container[B]

.LP <code>flatMap</code> invokes the function <code>f</code> for the element(s) of the collection producing a <em>new</em> collection, (all of) which are flattened into its result. For example, to get all permutations of two character strings that aren't the same character repeated twice:

	val chars = 'a' to 'z'
	val perms = chars flatMap { a => 
	  chars flatMap { b => 
	    if (a != b) Seq("%c%c".format(a, b)) 
	    else Seq() 
	  }
	}

.LP which is equivalent to the more concise for-comprehension (which is &mdash; roughly &mdash; syntactical sugar for the above):

	val perms = for {
	  a <- chars
	  b <- chars
	  if a != b
	} yield "%c%c".format(a, b)

`flatMap` is frequently useful when dealing with `Options` -- it will
collapse chains of options down to one,

	val host: Option[String] = ...
	val port: Option[Int] = ...
	
	val addr: Option[InetSocketAddress] =
	  host flatMap { h =>
	    port map { p =>
	      new InetSocketAddress(h, p)
	    }
	  }

.LP which is also made more succinct with <code>for</code>

	val addr: Option[InetSocketAddress] = for {
	  h <- host
	  p <- port
	} yield new InetSocketAddress(h, p)

The use of `flatMap` in `Future`s is discussed in the 
<a href="#Twitter's%20standard%20libraries-Futures">futures section</a>.

## Object oriented programming

Much of Scala's vastness lies in its object system. Scala is a *pure*
language in the sense that *all values* are objects; there is no
distinction between primitive types and composite ones.
Scala also features mixins allowing for more orthogonal and piecemeal
construction of modules that can be flexibly put together at compile
time with all the benefits of static type checking.

A motivation behind the mixin system was to obviate the need for 
traditional dependency injection. The culmination of this "component
style" of programming is [the cake
pattern](http://jonasboner.com/real-world-scala-dependency-injection-di/).

### Dependency injection

In our use, however, we've found that Scala itself removes so much of
the syntactical overhead of "classic" (constructor) dependency
injection that we'd rather just use that: it is clearer, the
dependencies are still encoded in the (constructor) type, and class
construction is so syntactically trivial that it becomes a breeze.
It's boring and simple and it works. *Use dependency injection for
program modularization*, and in particular, *prefer composition over
inheritance* -- for this leads to more modular and testable programs.
When encountering a situation requiring inheritance, ask yourself: how
would you structure the program if the language lacked support for
inheritance? The answer may be compelling.

Dependency injection typically makes use of traits,

	trait TweetStream {
	  def subscribe(f: Tweet => Unit)
	}
	class HosebirdStream extends TweetStream ...
	class FileStream extends TweetStream ...
	
	class TweetCounter(stream: TweetStream) {
	  stream.subscribe { tweet => count += 1 }
	}

It is common to inject *factories* -- objects that produce other
objects. In these cases, favor the use of simple functions over specialized
factory types.

	class FilteredTweetCounter(mkStream: Filter => TweetStream) {
	  mkStream(PublicTweets).subscribe { tweet => publicCount += 1 }
	  mkStream(DMs).subscribe { tweet => dmCount += 1 }
	}

### Traits

Dependency injection does not at all preclude the use of common *interfaces*, or
the implementation of common code in traits. Quite the contrary -- the use of traits are
highly encouraged for exactly this reason: multiple interfaces
(traits) may be implemented by a concrete class, and common code can
be reused across all such classes.

Keep traits short and orthogonal: don't lump separable functionality
into a trait, think of the smallest related ideas that fit together. For example,
imagine you have an something that can do IO:

	trait IOer {
	  def write(bytes: Array[Byte])
	  def read(n: Int): Array[Byte]
	}
	
.LP separate the two behaviors:

	trait Reader {
	  def read(n: Int): Array[Byte]
	}
	trait Writer {
	  def write(bytes: Array[Byte])
	}
	
.LP and mix them together to form what was an <code>IOer</code>: <code>new Reader with Writer</code>&hellip; Interface minimalism leads to greater orthogonality and cleaner modularization.

### Visibility

Scala has very expressive visibility modifiers. It's important to use
these as they define what constitutes the *public API*. Public APIs
should be limited so users don't inadvertently rely on implementation
details and limit the author's ability to change them: They are crucial
to good modularity. As a rule, it's much easier to expand public APIs
than to contract them. Poor annotations can also compromise backwards
binary compatibility of your code.

#### `private[this]`

A class member marked `private`, 

	private val x: Int = ...
	
.LP is visible to all <em>instances</em> of that class (but not their subclasses). In most cases, you want <code>private[this]</code>.

	private[this] val x: Int = ...

.LP which limits visibility to the particular instance. The Scala compiler is also able to translate <code>private[this]</code> into a simple field access (since access is limited to the statically defined class) which can sometimes aid performance optimizations.

#### Singleton class types

It's common in Scala to create singleton class types, for example

	def foo() = new Foo with Bar with Baz {
	  ...
	}

.LP In these situations, visibility can be constrained by declaring the returned type:

	def foo(): Foo with Bar = new Foo with Bar with Baz {
	  ...
	}

.LP where callers of <code>foo()</code> will see a restricted view (<code>Foo with Bar</code>) of the returned instance.

### Structural typing

Do not use structural types in normal use. They are a convenient and
powerful feature, but unfortunately do not have an efficient
implementation on the JVM. However -- due to an implementation quirk -- 
they provide a very nice shorthand for doing reflection.

	val obj: AnyRef
	obj.asInstanceOf[{def close()}].close()

## Error handling

Scala provides an exception facility, but do not use it for
commonplace errors, when the programmer must handle errors properly
for correctness. Instead, encode such errors explicitly: using
`Option` or `com.twitter.util.Try` are good, idiomatic choices, as
they harness the type system to ensure that the user is properly
considering error handling.

For example, when designing a repository, the following API may 
be tempting:

	trait Repository[Key, Value] {
	  def get(key: Key): Value
	}

.LP but this would require the implementor to throw an exception when the key is absent. A better approach is to use an <code>Option</code>:

	trait Repository[Key, Value] {
	  def get(key: Key): Option[Value]
	}

.LP This interface makes it obvious that the repository may not contain every key, and that the programmer must handle missing keys.  Furthermore, <code>Option</code> has a number of combinators to handle these cases. For example, <code>getOrElse</code> is used to supply a default value for missing keys:

	val repo: Repository[Int, String]
	repo.get(123) getOrElse "defaultString"

### Handling exceptions

Because Scala's exception mechanism isn't *checked* -- the compiler
cannot statically tell whether the programmer has covered the set of
possible exceptions -- it is often tempting to cast a wide net when
handling exceptions.

However, some exceptions are *fatal* and should never be caught; the
code

	try {
	  operation()
	} catch {
	  case _ => ...
	}

.LP is almost always wrong, as it would catch fatal errors that need to be propagated. Instead, use the <code>scala.util.control.NonFatal</code> extractor to handle only nonfatal exceptions.

	try {
	  operation()
	} catch {
	  case NonFatal(exc) => ...
	}

## Garbage collection

We spend a lot of time tuning garbage collection in production. The
garbage collection concerns are largely similar to those of Java
though idiomatic Scala code tends to generate more (short-lived)
garbage than idiomatic Java code -- a byproduct of the functional
style. Hotspot's generational garbage collection typically makes this
a nonissue as short-lived garbage is effectively free in most circumstances.

Before tackling GC performance issues, watch
[this](https://www.infoq.com/presentations/JVM-Performance-Tuning-twitter)
presentation by Attila that illustrates some of our experiences with
GC tuning.

In Scala proper, your only tool to mitigate GC problems is to generate
less garbage; but do not act without data! Unless you are doing
something obviously degenerate, use the various Java profiling tools
-- our own include
[heapster](https://github.com/mariusaeriksen/heapster) and
[gcprof](https://github.com/twitter/jvmgcprof).

## Java compatibility

When we write code in Scala that is used from Java, we ensure
that usage from Java remains idiomatic. Oftentimes this requires
no extra effort -- classes and pure traits are exactly equivalent
to their Java counterpart -- but sometimes separate Java APIs
need to be provided. A good way to get a feel for your library's Java
API is to write a unittest in Java (just for compilation); this also ensures
that the Java-view of your library remains stable over time as the Scala
compiler can be volatile in this regard.

Traits that contain implementation are not directly
usable from Java: extend an abstract class with the trait
instead.

	// Not directly usable from Java
	trait Animal {
	  def eat(other: Animal)
	  def eatMany(animals: Seq[Animal) = animals foreach(eat(_))
	}
	
	// But this is:
	abstract class JavaAnimal extends Animal

## Twitter's standard libraries

The most important standard libraries at Twitter are
[Util](https://github.com/twitter/util) and
[Finagle](https://github.com/twitter/finagle). Util should be
considered an extension to the Scala and Java standard libraries, 
providing missing functionality or more appropriate implementations. Finagle
is our RPC system; the kernel distributed systems components.

### Futures

Futures have been <a href="#Concurrency-Futures">discussed</a>
briefly in the <a href="#Concurrency">concurrency section</a>. They 
are the central mechanism for coordination asynchronous
processes and are pervasive in our codebase and core to Finagle.
Futures allow for the composition of concurrent events, and simplify
reasoning about highly concurrent operations. They also lend themselves
to a highly efficient implementation on the JVM.

Twitter's futures are *asynchronous*, so blocking operations --
basically any operation that can suspend the execution of its thread;
network IO and disk IO are examples -- must be handled by a system
that itself provides futures for the results of said operations.
Finagle provides such a system for network IO.

Futures are plain and simple: they hold the *promise* for the result
of a computation that is not yet complete. They are a simple container
-- a placeholder. A computation could fail of course, and this must 
also be encoded: a Future can be in exactly one of 3 states: *pending*,
*failed* or *completed*.

<div class="explainer">
<h3>Aside: <em>Composition</em></h3>
<p>Let's revisit what we mean by composition: combining simpler components
into more complicated ones. The canonical example of this is function
composition: Given functions <em>f</em> and
<em>g</em>, the composite function <em>(g&#8728;f)(x) = g(f(x))</em> &mdash; the result
of applying <em>f</em> to <em>x</em> first, and then applying <em>g</em> to the result
of that &mdash; can be written in Scala:</p>

<pre><code>val f = (i: Int) => i.toString
val g = (s: String) => s+s+s
val h = g compose f  // : Int => String
	
scala> h(123)
res0: java.lang.String = 123123123</code>

.LP the function <em>h</em> being the composite. It is a <em>new</em> function that combines both <em>f</em> and <em>g</em> in a predefined way.
</div>

Futures are a type of collection -- they are a container of
either 0 or 1 elements -- and you'll find they have standard 
collection methods (eg. `map`, `filter`, and `foreach`). Since a Future's
value is deferred, the result of applying any of these methods
is necessarily also deferred; in

	val result: Future[Int]
	val resultStr: Future[String] = result map { i => i.toString }

.LP the function <code>{ i => i.toString }</code> is not invoked until the integer value becomes available, and the transformed collection <code>resultStr</code> is also in pending state until that time.

Lists can be flattened;

	val listOfList: List[List[Int]] = ...
	val list: List[Int] = listOfList.flatten

.LP and this makes sense for futures, too:

	val futureOfFuture: Future[Future[Int]] = ...
	val future: Future[Int] = futureOfFuture.flatten

.LP since futures are deferred, the implementation of <code>flatten</code> &mdash; it returns immediately &mdash; has to return a future that is the result of waiting for the completion of the outer future (<code><b>Future[</b>Future[Int]<b>]</b></code>) and after that the inner one (<code>Future[<b>Future[Int]</b>]</code>). If the outer future fails, the flattened future must also fail.

Futures (like Lists) also define `flatMap`; `Future[A]` defines its signature as

	flatMap[B](f: A => Future[B]): Future[B]
	
.LP which is like the combination of both <code>map</code> and <code>flatten</code>, and we could implement it that way:

	def flatMap[B](f: A => Future[B]): Future[B] = {
	  val mapped: Future[Future[B]] = this map f
	  val flattened: Future[B] = mapped.flatten
	  flattened
	}

This is a powerful combination! With `flatMap` we can define a Future that
is the result of two futures sequenced, the second future computed based
on the result of the first one. Imagine we needed to do two RPCs in order
to authenticate a user (id), we could define the composite operation in the
following way:

	def getUser(id: Int): Future[User]
	def authenticate(user: User): Future[Boolean]
	
	def isIdAuthed(id: Int): Future[Boolean] = 
	  getUser(id) flatMap { user => authenticate(user) }

.LP an additional benefit to this type of composition is that error handling is built-in: the future returned from <code>isAuthed(..)</code> will fail if either of <code>getUser(..)</code> or <code>authenticate(..)</code> does with no extra error handling code.

#### Style

Future callback methods (`respond`, `onSuccess`, `onFailure`, `ensure`)
return a new future that is *chained* to its parent. This future is guaranteed
to be completed only after its parent, enabling patterns like

	acquireResource() onSuccess { value =>
	  computeSomething(value)
	} ensure {
	  freeResource()
	}

.LP where <code>freeResource()</code> is guaranteed to be executed only after <code>computeSomething</code>, allowing for emulation of the native <code>try .. finally</code> pattern.

Use `onSuccess` instead of `foreach` -- it is symmetrical to `onFailure` and
is a better name for the purpose, and also allows for chaining.

Always try to avoid creating `Promise` instances directly: nearly every task
can be accomplished via the use of predefined combinators. These
combinators ensure errors and cancellations are propagated, and generally
encourage *dataflow style* programming which usually <a
href="#Concurrency-Futures">obviates the need for synchronization and
volatility declarations</a>.

Code written in tail-recursive style is not subject to stack-space leaks,
allowing for efficient implementation of loops in dataflow-style:

	case class Node(parent: Option[Node], ...)
	def getNode(id: Int): Future[Node] = ...

	def getHierarchy(id: Int, nodes: List[Node] = Nil): Future[Node] =
	  getNode(id) flatMap {
	    case n@Node(Some(parent), ..) => getHierarchy(parent, n :: nodes)
	    case n => Future.value((n :: nodes).reverse)
	  }

`Future` defines many useful methods: Use `Future.value()` and
`Future.exception()` to create pre-satisfied futures.
`Future.collect()`, `Future.join()` and `Future.select()` provide
combinators that turn many futures into one (ie. the gather part of a
scatter-gather operation).

#### Cancellation

Futures implement a weak form of cancellation. Invoking `Future#cancel`
does not directly terminate the computation but instead propagates a
level triggered *signal* that may be queried by whichever process
ultimately satisfies the future. Cancellation flows in the opposite
direction from values: a cancellation signal set by a consumer is
propagated to its producer. The producer uses `onCancellation` on
`Promise` to listen to this signal and act accordingly.

This means that the cancellation semantics depend on the producer,
and there is no default implementation. *Cancellation is but a hint*.

#### Locals

Util's
[`Local`](https://github.com/twitter/util/blob/master/util-core/src/main/scala/com/twitter/util/Local.scala#L40)
provides a reference cell that is local to a particular future dispatch tree. Setting the value of a local makes this
value available to any computation deferred by a Future in the same thread. They are analogous to thread locals,
except their scope is not a Java thread but a tree of "future threads". In

	trait User {
	  def name: String
	  def incrCost(points: Int)
	}
	val user = new Local[User]

	...

	user() = currentUser
	rpc() ensure {
	  user().incrCost(10)
	}

.LP <code>user()</code> in the <code>ensure</code> block will refer to the value of the <code>user</code> local at the time the callback was added.

As with thread locals, `Local`s can be very convenient, but should
almost always be avoided: make sure the problem cannot be sufficiently
solved by passing data around explicitly, even if it is somewhat
burdensome.

Locals are used effectively by core libraries for *very* common 
concerns -- threading through RPC traces, propagating monitors,
creating "stack traces" for future callbacks -- where any other solution
would unduly burden the user. Locals are inappropriate in almost any
other situation.

### Offer/Broker

Concurrent systems are greatly complicated by the need to coordinate
access to shared data and resources.
[Actors](https://doc.akka.io/api/akka/current/index.html#akka.actor.Actor)
present one strategy of simplification: each actor is a sequential process
that maintains its own state and resources, and data is shared by
messaging with other actors. Sharing data requires communicating between
actors.

Offer/Broker builds on this in three important ways. First,
communication channels (Brokers) are first class -- that is, you send
messages via Brokers, not to an actor directly. Secondly, Offer/Broker
is a synchronous mechanism: to communicate is to synchronize. This
means we can use Brokers as a coordination mechanism: when process `a`
has sent a message to process `b`; both `a` and `b` agree on the state
of the system. Lastly, communication can be performed *selectively*: a
process can propose several different communications, and exactly one
of them will obtain.

In order to support selective communication (as well as other
composition) in a general way, we need to decouple the description of
a communication from the act of communicating. This is what an `Offer`
does -- it is a persistent value that describes a communication; in
order to perform that communication (act on the offer), we synchronize
via its `sync()` method

	trait Offer[T] {
	  def sync(): Future[T]
	}

.LP which returns a <code>Future[T]</code> that yields the exchanged value when the communication obtains.

A `Broker` coordinates the exchange of values through offers -- it is the channel of communications:

	trait Broker[T] {
	  def send(msg: T): Offer[Unit]
	  val recv: Offer[T]
	}

.LP so that, when creating two offers

	val b: Broker[Int]
	val sendOf = b.send(1)
	val recvOf = b.recv

.LP and <code>sendOf</code> and <code>recvOf</code> are both synchronized

	// In process 1:
	sendOf.sync()

	// In process 2:
	recvOf.sync()

.LP both offers obtain and the value <code>1</code> is exchanged.

Selective communication is performed by combining several offers with
`Offer.choose`

	def choose[T](ofs: Offer[T]*): Offer[T]

.LP which yields a new offer that, when synchronized, obtains exactly one of <code>ofs</code> &mdash; the first one to become available. When several are available immediately, one is chosen at random to obtain.

The `Offer` object has a number of one-off Offers that are used to compose with Offers from a Broker.

	Offer.timeout(duration): Offer[Unit]

.LP is an offer that activates after the given duration. <code>Offer.never</code> will never obtain, and <code>Offer.const(value)</code> obtains immediately with the given value. These are useful for composition via selective communication. For example to apply a timeout on a send operation:

	Offer.choose(
	  Offer.timeout(10.seconds),
	  broker.send("my value")
	).sync()

It may be tempting to compare the use of Offer/Broker to
[SynchronousQueue](https://docs.oracle.com/javase/6/docs/api/java/util/concurrent/SynchronousQueue.html),
but they are different in subtle but important ways. Offers can be composed in ways that such queues simply cannot. For example, consider a set of queues, represented as Brokers:

	val q0 = new Broker[Int]
	val q1 = new Broker[Int]
	val q2 = new Broker[Int]
	
.LP Now let's create a merged queue for reading:

	val anyq: Offer[Int] = Offer.choose(q0.recv, q1.recv, q2.recv)
	
.LP <code>anyq</code> is an offer that will read from first available queue. Note that <code>anyq</code> is <em>still synchronous</em> &mdash; we still have the semantics of the underlying queues. Such composition is simply not possible using queues.
	
#### Example: A Simple Connection Pool

Connection pools are common in network applications, and they're often
tricky to implement -- for example, it's often desirable to have
timeouts on acquisition from the pool since various clients have different latency
requirements. Pools are simple in principle: we maintain a queue of
connections, and we satisfy waiters as they come in. With traditional
synchronization primitives this typically involves keeping two queues:
one of waiters (when there are no connections), and one of connections
(when there are no waiters).

Using Offer/Brokers, we can express this quite naturally:

	class Pool(conns: Seq[Conn]) {
	  private[this] val waiters = new Broker[Conn]
	  private[this] val returnConn = new Broker[Conn]

	  val get: Offer[Conn] = waiters.recv
	  def put(c: Conn) { returnConn ! c }
	
	  private[this] def loop(connq: Queue[Conn]) {
	    Offer.choose(
	      if (connq.isEmpty) Offer.never else {
	        val (head, rest) = connq.dequeue()
	        waiters.send(head) map { _ => loop(rest) }
	      },
	      returnConn.recv map { c => loop(connq.enqueue(c)) }
	    ).sync()
	  }
	
	  loop(Queue.empty ++ conns)
	}

`loop` will always offer to have a connection returned, but only offer
to send one when the queue is nonempty. Using a persistent queue simplifies
reasoning further. The interface to the pool is also through an Offer, so if a caller
wishes to apply a timeout, they can do so through the use of combinators:

	val conn: Future[Option[Conn]] = Offer.choose(
	  pool.get map { conn => Some(conn) },
	  Offer.timeout(1.second) map { _ => None }
	).sync()

No extra bookkeeping was required to implement timeouts; this is due to
the semantics of Offers: if `Offer.timeout` is selected, there is no
longer an offer to receive from the pool -- the pool and its caller
never simultaneously agreed to receive and send, respectively, on the
`waiters` broker.

#### Example: Sieve of Eratosthenes

It is often useful -- and sometimes vastly simplifying -- to structure
concurrent programs as a set of sequential processes that communicate
synchronously. Offers and Brokers provide a set of tools to make this simple
and uniform. Indeed, their application transcends what one might think
of as "classic" concurrency problems -- concurrent programming (with
the aid of Offer/Broker) is a useful *structuring* tool, just as
subroutines, classes, and modules are -- another important 
idea from CSP.

One example of this is the [Sieve of
Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes),
which can be structured as a successive application of filters to a
stream of integers. First, we'll need a source of integers:

	def integers(from: Int): Offer[Int] = {
	  val b = new Broker[Int]
	  def gen(n: Int): Unit = b.send(n).sync() ensure gen(n + 1)
	  gen(from)
	  b.recv
	}

.LP <code>integers(n)</code> is simply the offer of all consecutive integers starting at <code>n</code>. Then we need a filter:

	def filter(in: Offer[Int], prime: Int): Offer[Int] = {
	  val b = new Broker[Int]
	  def loop() {
	    in.sync() onSuccess { i =>
	      if (i % prime != 0)
	        b.send(i).sync() ensure loop()
	      else
	        loop()
	    }
	  }
	  loop()
	
	  b.recv
	}

.LP <code>filter(in, p)</code> returns the offer that removes multiples of the prime <code>p</code> from <code>in</code>. Finally, we define our sieve:

	def sieve = {
	  val b = new Broker[Int]
	  def loop(of: Offer[Int]) {
	    for (prime <- of.sync(); _ <- b.send(prime).sync())
	      loop(filter(of, prime))
	  }
	  loop(integers(2))
	  b.recv
	}

.LP <code>loop()</code> works simply: it reads the next (prime) number from <code>of</code>, and then applies a filter to <code>of</code> that excludes this prime. As <code>loop</code> recurses, successive primes are filtered, and we have a Sieve. We can now print out the first 10000 primes:

	val primes = sieve
	0 until 10000 foreach { _ =>
	  println(primes.sync()())
	}

Besides being structured into simple, orthogonal components, this
approach gives you a streaming Sieve: you do not a priori need to
compute the set of primes you are interested in, further enhancing
modularity.

## Acknowledgments

The lessons herein are those of Twitter's Scala community -- I hope
I've been a faithful chronicler.

Blake Matheny, Nick Kallen, Steve Gury, and Raghavendra Prabhu
provided much helpful guidance and many excellent suggestions.

[Scala]: https://www.scala-lang.org/
[Finagle]: https://github.com/twitter/finagle
[Util]: https://github.com/twitter/util

<!-- Unknown Words:
	generic
	variance
 -->