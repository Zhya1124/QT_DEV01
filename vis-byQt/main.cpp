#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include "file_process.h"
int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    QScopedPointer<FileProcess> fileprocess(new FileProcess);
    engine.rootContext()->setContextProperty("fileprocess", fileprocess.data());

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
