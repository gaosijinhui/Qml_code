#include "myobject.h"

Myobject::Myobject(QObject *parent)
    : QObject{parent}
{

}

Myobject *Myobject::getInstance()
{
    static Myobject * obj= new Myobject();
    return obj;
}

int Myobject::getMy_value() const
{
    return my_value;
}

void Myobject::setMy_value(int newMy_value)
{
    if (my_value == newMy_value)
        return;
    my_value = newMy_value;
    emit my_valueChanged();
}

const QString &Myobject::getMy_string() const
{
    return my_string;
}

void Myobject::setMy_string(const QString &newMy_string)
{
    if (my_string == newMy_string)
        return;
    my_string = newMy_string;
    emit my_stringChanged();
}

void Myobject::fun()
{
    cppsig(23);    //调用发送信号
}

//槽函数
//void Myobject::cppfun(int i, QString s)
//{
//    qDebug()<<"  "<<i<<" ,"<<s;
//}

