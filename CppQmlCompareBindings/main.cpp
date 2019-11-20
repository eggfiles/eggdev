#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "controller.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //ermöglicht das dynamische Instanziieren dieser Klassen-Objekte in QML
    //in diesem Beispiel werden die Objekte bei Programmstart instanziiert und für QML bekannt gemacht
    //qmlRegisterType<TwoWayBinding>("KDAB.Components",1 , 0, "TwoWayBinding");
    //qmlRegisterType<BooleanValue>("KDAB.Components",1 , 0, "BooleanValue");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    Controller controller;

    engine.rootContext()->setContextProperty("_controller", &controller);

    engine.load(url);

    return app.exec();
}
