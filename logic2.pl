oncampus(ram).%3.03
dissertation(sam).%3.03
offcampus(tam).%3.03
phd(rita).%3.03
seminar(sita).%3.03
thesis(tita).%3.03

duesclrinsti(ram).%3.09
duesclrhostel(ram).%3.09
duesclrreco(ram).%3.09
advfee(ram).%3.01

duesclrinsti(sam).%3.09
duesclrhostel(sam).%3.09
duesclrreco(sam).%3.09
advfee(sam).%3.01

approval(ram,darc).%3.03

consult(ram,did).%3.06

gradesheet(ram).%3.09(ii)
noIgrade(ram).%3.09(iii)

notdebar(ram).%3.09(iv)

gawaited(sam).%3.10
consult(ram,darc).%3.10

faith(ram,darc).%3.11
thingap(ps1).%3.11
fbulletin(ram).%3.12

prepared(ram).%3.13

consult(did,ic).%3.13

desire(ram,ps1).%3.13
reqd(authority,ram).%3.13

grade(ram,thermo).
grade(ram,maths1).

grade(ram,logic).
grade(ram,oop).
grade(ram,dd).
grade(ram,dsa).
grade(ram,ps1).


preceding(thermo,ps1).
preceding(maths1,ps1).

preceding(logic,ps2single).
preceding(oop,ps2single).
preceding(dd,ps2single).
preceding(dsa,ps2single).
preceding(ps1,ps2single).


preceding(highcourse1,pshigh).
preceding(highcourse2,pshigh).
preceding(highcourse3,pshigh).
preceding(highcourse4,pshigh).
preceding(highcourse5,pshigh).


preceding1(algebra,ps2dual).
preceding1(topo,ps2dual).
preceding1(era,ps2dual).
preceding1(numal,ps2dual).
preceding1(ps1,ps2dual).


preceding2(logic,ps2dual).
preceding2(oop,ps2dual).
preceding2(dd,ps2dual).
preceding2(dsa,ps2dual).
preceding2(ps1,ps2dual).


preceding(logic,cdcsingle).
preceding(oop,cdcsingle).
preceding(dd,cdcsingle).
preceding(dsa,cdcsingle).
preceding(ps1,cdcsingle).

preceding1(algebra,cdc1dual).
preceding1(topo,cdc1dual).
preceding1(era,cdc1dual).
preceding1(numal,cdc1dual).
preceding1(ps1,cdc1dual).


preceding2(logic,cdc2dual).
preceding2(oop,cdc2dual).
preceding2(dd,cdc2dual).
preceding2(dsa,cdc2dual).
preceding2(ps1,cdc2dual).



nobearing(logic,cdcsingle).
notcleared(ram,logic).
notcleared(sam,dd).


consult(ram,leader).
notoverprepared(ram,logic).
notunderprepared(ram,logic).
notoverprepared(ram,ps1).
notunderprepared(ram,ps1).
notoverprepared(ram,ps2single).
notunderprepared(ram,ps2single).
notoverprepared(ram,ps2dual).
notunderprepared(ram,ps2dual).

notoverprepared(ram,pshigh).
notunderprepared(ram,pshigh).
notoverprepared(ram,cdchigh).
notunderprepared(ram,ps1).

notoverprepared(ram,cdcsingle).
notunderprepared(ram,cdcsingle).
notoverprepared(ram,cdc1dual).
notunderprepared(ram,cdc1dual).
notoverprepared(ram,cdc2dual).
notunderprepared(ram,cdc2dual).
notoverprepared(ram,cdcother).
notunderprepared(ram,cdcother).

notoverprepared(ram,dcocown).
notunderprepared(ram,dcocown).
notoverprepared(ram,dcocother).
notunderprepared(ram,dcocother).
notoverprepared(ram,dcocowndual).
notunderprepared(ram,dcocowndual).
notoverprepared(ram,dcocotherdual).
notunderprepared(ram,dcocotherdual).

notoverprepared(ram,dcochigh).
notunderprepared(ram,dcochigh).




notoverprepared(ram,maths1).
notunderprepared(ram,maths1).
notoverprepared(ram,thermo).
notunderprepared(ram,thermo).


numberofcourses(ram,7).
vigilance(ram).%3.18
noNC(ram).%3.19


prereq(Stud,CourseA,ps1):-preceding(CourseA,ps1),grade(Stud,CourseA).%3.14
prereq(Stud,CourseA,ps2single):-preceding(CourseA,ps2single),grade(Stud,CourseA).%3.14
prereq(Stud,CourseA,ps2dual):-preceding1(CourseA,ps2dual),grade(Stud,CourseA);preceding2(CourseA,ps2dual),grade(Stud,CourseA).%dual case taken 2 degrees. 3.14
prereq(Stud,CourseA,pshigh):-preceding(CourseA,pshigh),grade(Stud,CourseA).%3.14

prereq(Stud,CourseA,cdcsingle):-(preceding(CourseA,cdcsingle),grade(Stud,CourseA),\+notcleared(Stud,CourseA));((preceding(CourseA,cdcsingle),grade(Stud,CourseA)),notcleared(Stud,CourseA),exceptional(Stud,cdcsingle,Ans)).%3.1


prereq(Stud,CourseA,cdc1dual):-(preceding1(CourseA,cdc1dual),grade(Stud,CourseA),\+notcleared(Stud,CourseA));((preceding1(CourseA,cdc1dual),grade(Stud,CourseA)),notcleared(Stud,CourseA),exceptional(Stud,cdc1dual,Ans)).%3.14


prereq(Stud,CourseA,cdc2dual):-preceding1(CourseA,cdc1dual),preceding2(CourseA,cdc2dual),grade(Stud,CourseA),(notcleared(Stud,CourseA)->exceptional(Stud,cdc2dual,Ans);notcleared(Stud,CourseA)->exceptional(Stud,cdcsingle,Ans)).%3.14



prereq(Stud,CourseA,cdcother):- numberofcourses(Stud,Ans)> 5. %assume 5 is minimum no. of courses.


complete(ram,cdcsingle).%all courses completed
complete(ram,cdc1dual).
complete(ram,cdc2dual).

taken(ram,cdcsingle).%taken a course this semester
taken(ram,cdc1dual).
taken(ram,cdc2dual).


consult(ram,leader).


prereq(Stud,CourseA,dcocown):- complete(Stud,cdcsingle);taken(Stud,cdcsingle).
prereq(Stud,CourseA,dcocowndual):- (complete(Stud,cdc1dual),complete(Stud,cdc2dual));(taken(Stud,cdc1dual),taken(Stud,cdc2dual)).


prereq(Stud,CourseA,dcocother):- complete(Stud,cdcsingle);taken(Stud,cdcsingle).
prereq(Stud,CourseA,dcocotherdual):- complete(Stud,cdc1dual);taken(Stud,cdc1dual).

prereq(Stud,CourseA,dcochigh):- complete(Stud,cdcsingle);taken(Stud,cdcsingle).
prereq(Stud,CourseA,dcocohigh):- complete(Stud,cdc1dual);taken(Stud,cdc1dual).




exceptional(Stud,CourseB,Ans):-(CourseB==cdcsingle,consult(Stud,leader),notcleared(Stud,CourseA),notcleared(Stud,CourseC),CourseC==CourseA,nobearing(CourseA,cdcsingle));(CourseB==cdc1dual,consult(Stud,leader),notcleared(Stud,CourseA),notcleared(Stud,CourseC),CourseC==CourseA,nobearing(CourseA,cdc1dual));(CourseB==cdc2dual,consult(Stud,leader),notcleared(Stud,CourseA),notcleared(Stud,CourseC),CourseC==CourseA,nobearing(CourseA,cdc2dual)).%%handling exception cases for prereqs cleared.


prog(Stud,Prog,Ans3):- Prog==oncampus, oncampus(Stud), approval(Stud,darc); Prog==offcampus, offcampus(Stud), approval(Stud,dwilp);Prog==phd, phd(Stud),approval(Stud,drnc);Prog==thesis, thesis(Stud),approval(Stud,drnc);Prog==seminar, seminar(Stud),approval(Stud,drnc);Prog==dissertation, dissertation(Stud),approval(Stud,drnc).%3.03


latereg(Stud,Days,Ans4):-Days>7-> consult(Stud,did);Days<8.%3.06

duesclr(Stud,Ans5):-duesclrinsti(Stud),duesclrhostel(Stud),duesclrreco(Stud).%3.09(i)

regelig(Stud,Ans):-duesclr(Stud,Ans),advfee(Stud).%3.01

gsheet(Stud,Ans6):-gradesheet(Stud),noIgrade(Stud).%3.09


regcomp(Stud,Prog,Days,Ans2):-regelig(Stud,Ans), prog(Stud,Prog,Ans3),latereg(Stud,Days,Ans4),duesclr(Stud,Ans5),gsheet(Stud,Ans),notdebar(Stud),((gawaited(Stud),consult(Stud,darc));\+gawaited(Stud)) .%3.06, 3.09, 3.10 used NOT condition

regcomp(Stud,Prog,Ans2):-regelig(Stud,Ans), prog(Stud,Prog,Ans3),duesclr(Stud,Ans5),gsheet(Stud,Ans),notdebar(Stud),((gawaited(Stud),consult(Stud,darc));\+gawaited(Stud)) .%3.03, 3.09, 3.10 used NOT condition



classperm(Stud,Prog,Ans):-regcomp(Stud,Prog,Ans2).%3.04
instperm(Stud,Prog,Ans):-regcomp(Stud,Prog,Ans2).%3.04

normalreg(Stud,Ans):-fbulletin(Stud).%3.12


findprereq(Stud,Course,Ans):- prereq(Stud,CourseA,Course)->Ans=CourseA.%3.13

waived(Stud,Ans):-consult(did,ic),prepared(Stud).%3.13

satisfy(Stud,Course,Ans):- prereq(Stud,none,Course);(findprereq(Stud,Course,Ans),grade(Stud, Ans)).%3.13


latestgrade(Stud,Course,Grade,Ans):-(Grade==RC;Grade==W->Ans= B);Ans=Grade.

examine(Stud):-noNC(Stud).%


regcourse(Stud,Course,Prog,Count,Days,Ans7):-(Count == 0,vigilance(Stud),((regcomp(Stud,Prog,Days,Ans8);(((faith(Stud,darc),\+duesclr(Stud,Ans5));(faith(Stud,darc),\+gsheet(Stud,Ans5));(faith(Stud,darc),\+notdebar(Stud))),thingap(Course))),normalreg(Stud,Ans),((satisfy(Stud,Course,Ans11));waived(Stud,Ans))),notoverprepared(Stud,Course),notunderprepared(Stud,Course));((Count >0,vigilance(Stud) ,notoverprepared(Stud,Course),notunderprepared(Stud,Course),((regcomp(Stud,Prog,Days,Ans8);(((faith(Stud,darc),\+duesclr(Stud,Ans5));(faith(Stud,darc),\+gsheet(Stud,Ans5));(faith(Stud,darc),\+notdebar(Stud))),thingap(Course))),normalreg(Stud,Ans),((satisfy(Stud,Course,Ans11));waived(Stud,Ans))),( desire(Stud,Course);reqd(authority,Stud)) )) .




%2 regcourse functions one with days exceeding registration and one without days exceeding.
%Vigilance Registration in programme complete 3.16
%faith but dues not cleared 3.11
%faith and gradesheet withheld or no I grade 3.11
%faith and barred 3.11
%thingap of course 3.11
%normal registration following bulletin 3.12
%satisfy prereq 3.13-15
%prereq not satisfied but waived
%not overprepared, not underprepared 3.18
%multiple registrations allowed 3.13



regcourse(Stud,Course,Prog,Count,Ans7):-(Count == 0,vigilance(Stud),((regcomp(Stud,Prog,Ans8);(((faith(Stud,darc),\+duesclr(Stud,Ans5));(faith(Stud,darc),\+gsheet(Stud,Ans5));(faith(Stud,darc),\+notdebar(Stud))),thingap(Course))),normalreg(Stud,Ans),((satisfy(Stud,Course,Ans11));waived(Stud,Ans))),notoverprepared(Stud,Course),notunderprepared(Stud,Course));((Count >0,vigilance(Stud) ,notoverprepared(Stud,Course),notunderprepared(Stud,Course),((regcomp(Stud,Prog,Ans8);(((faith(Stud,darc),\+duesclr(Stud,Ans5));(faith(Stud,darc),\+gsheet(Stud,Ans5));(faith(Stud,darc),\+notdebar(Stud))),thingap(Course))),normalreg(Stud,Ans),((satisfy(Stud,Course,Ans11));waived(Stud,Ans))),( desire(Stud,Course);reqd(authority,Stud)) )) .






