unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
     { private declarations }
  public
     { public declarations }
  end;
  type
//Объявление класса многоугольник Tpolygon.
    TPolygon = class
//Закрытые поля.
      Private
K : integer;
p : array of real;
//Открытые методы.
      Public
      constructor Create; //Конструктор.
      //Метод вычисления периметра.
      function Perimetr():real;
//Метод формирования сведений.
function Show():String;
Protected //Защищенные методы.
//Процедура проверки данных.
procedure Set_Input(m:integer);
Published
//Объявление свойства n.
//Свойство n оперирует полем K.
//В описании свойства после слова read
//стоит имя поля — K. Это значит, что
//функция чтения отсутствует и пользователь
//может читать непосредственно значение поля.
//Ссылка на функцию Set_Input после
//зарезервированного слова write означает,
//что с помощью этой функции в поле K будут
//записываться новые значения.
Property n: integer read K write Set_Input;
    end;

var
  Form1: TForm1;
  //Объявление переменной типа
//класс многоугольник.
Figure: TPolygon;
implementation
 //Описание конструктора.
constructor TPolygon.Create;
var i:integer;
begin
K:=50;//Присваивание начальных значений полям.
//Выделение памяти под массив p.
SetLength(p,K);
for i:=0 to K-1 do p[i]:=0;
inherited Create;
end;
//Функция вычисления периметра.
function TPolygon.Perimetr():real;
var Sum:real; i:integer;
begin
Sum:=0;
for i:=0 to K-1 do Sum:=Sum+p[i];
Perimetr:=Sum;
end;
//Метод формирования сведений о фигуре.
function TPolygon.Show():String;
begin
Show:='Многоугольник с количеством сторон '+
IntToStr(K)+chr(13)+'Периметр = '+
FloatToStr(Perimetr())
end;
//Метод записи данных в поле K.
procedure TPolygon.Set_Input(m:integer);
begin
//Если введенное значение положительное число,
//то записать его в поле K,
//иначе вернуться к начальному значению.
if m>1 then K:=m else K:=50;
end;
{$R *.lfm}

{ TForm1 }
//Обработка события.
procedure TForm1.Button1Click(Sender: TObject);
var i, m:integer;
s:string;
begin
  //Ввод количества сторон многоугольника.
s:=InputBox('Ввод','Введите количество сторон многоугольника','6');
Val(s,m);
//Инициализация объекта.
Figure:=TPolygon.Create;
with Figure do
begin
//Метод проверки исходных данных.
Set_Input(m);
//Формирование массива случайных чисел.
for i:=0 to K-1 do p[i]:=random(50);
//Обращение к методу вычисления периметра.
s:=Show();
end;
//Вывод результатов в окно формы.
Label1.Caption:= s;
end;

end.

