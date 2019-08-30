#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>

#include "file_process.h"

#include "../src/QuickQanava.h"
#include "./src/visnode.h"

using namespace qan;

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QScopedPointer<FileProcess> fileprocess(new FileProcess);
    engine.rootContext()->setContextProperty("fileprocess", fileprocess.data());

    QuickQanava::initialize(&engine);
    qmlRegisterType< qan::VisNode >( "visFD", 1, 0, "AbstractVisNode");
    qmlRegisterType< qan::VisGraph >( "visFD", 1, 0, "VisGraph");

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;


    return app.exec();
}
