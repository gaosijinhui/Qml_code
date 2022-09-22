#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "myobject.h"
#include <QObject>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;  //全局对象

    QQmlContext* context = engine.rootContext();
    context->setContextProperty("QUAN_PROPERTY",100);  //上下文对象，该属性可被qml直接全局访问
//    Myobject obj;
//    context->setContextProperty("Myobject",Myobject::getInstance());  //(可行但会报错，一般不用)

    qmlRegisterType<Myobject>("Myobj",1,0,"Myobject");   //注册自定义object类
    qmlRegisterSingletonInstance("Myobj",1,0,"Myobject",Myobject::getInstance());   //补充注册对象，qml中无需再申明，可以直接通过类名调用类成员

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

//    auto list = engine.rootObjects();
//    auto window = list.first();
//    QObject::connect(window,SIGNAL(qmlsig(int,QString)),Myobject::getInstance(),SLOT(cppfun(int,QString)));   //qml端发送信号，c++端绑定object槽函数
//    QObject::connect(Myobject::getInstance(),SIGNAL(cppsig(QVariant)),window,SLOT(qmlslot(QVariant)));   //c++端发送信号，绑定qml端函数
//    Myobject::getInstance()->fun();    //调用fun函数发送信号

    return app.exec();
}
