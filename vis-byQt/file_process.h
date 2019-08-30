#ifndef FILE_PROCESS_H
#define FILE_PROCESS_H

#include <QObject>
#include <QFile>
#include <QTextStream>

//用来读取json文件
#include <QJsonDocument>
#include <QJsonParseError>
#include <QJsonObject>
#include <QJsonArray>

//#include <graph.h>

/*
    8/24 建立file_process类来处理json文件的增删改查


    8/26 添加addRole函数 向json文件中添加nodes中的信息
*/

class FileProcess:public QObject
{
    Q_OBJECT

public:

    FileProcess();  //构造函数
    ~FileProcess();  //析构函数


    //变量
    Q_PROPERTY(QString content READ readJsonFile WRITE writeJsonFile)
    Q_PROPERTY(QString filepath READ getJsonFilePath WRITE setJsonFilePath)

    //函数
    Q_INVOKABLE bool readJsonFile();  //读取文件内容

    Q_INVOKABLE QString getJsonFilePath() //读取文件路径
    {
        return filePath;
    }

    Q_INVOKABLE void setJsonFilePath(QString filename)
    {
        filePath = filename;
    }

    Q_INVOKABLE void writeJsonFile(QString name);
    Q_INVOKABLE void addRole(QString name,QString imagPath);


private:

    QString filePath;
    QJsonObject root;

};

#endif // FILE_PROCESS_H
