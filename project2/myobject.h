#ifndef MYOBJECT_H
#define MYOBJECT_H

#include <QObject>
#include <QtQml>

class Myobject : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Myobject(QObject *parent = nullptr);
    static Myobject * getInstance();

    int getMy_value() const;
    void setMy_value(int newMy_value);

    const QString &getMy_string() const;
    void setMy_string(const QString &newMy_string);
    Q_INVOKABLE void fun();  //可在qml中直接调用

signals:
    void my_valueChanged();

    void my_stringChanged();

    void cppsig(QVariant i);

private:
    int my_value;
    QString my_string;

    Q_PROPERTY(int my_value READ getMy_value WRITE setMy_value NOTIFY my_valueChanged)
    Q_PROPERTY(QString my_string READ getMy_string WRITE setMy_string NOTIFY my_stringChanged)

//public slots:
//    void cppfun(int i);
};

#endif // MYOBJECT_H
