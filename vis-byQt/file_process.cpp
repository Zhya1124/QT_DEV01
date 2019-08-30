#include<file_process.h>
#include<QDebug>

FileProcess::FileProcess() //构造函数
{

}

FileProcess::~FileProcess() //析构函数
{

}

//函数
bool FileProcess::readJsonFile()//读取文件内容
{
    //Graph graph = Graph();

    if(filePath.startsWith("file"))
    {
      filePath = filePath.mid(8,filePath.length()-7);
    }
    qDebug()<<"path: "<<filePath<<endl;

    QFile loadFile(filePath);
    qDebug()<<loadFile.exists();
    if(!loadFile.open(QIODevice::ReadOnly))
    {
        qDebug()<<"打开文件失败";
        return false;
    }

    QByteArray allDate = loadFile.readAll();
    loadFile.close();

    QJsonParseError json_error;

    QJsonDocument jsonDoc(QJsonDocument::fromJson(allDate,&json_error));

    qDebug()<<json_error.error;

    if(json_error.error != QJsonParseError::NoError)
    {
        qDebug()<<"文件读取失败";
        return false;
    }

    QJsonObject rootObj = jsonDoc.object();
    root = rootObj;
    QStringList keys = rootObj.keys();
    int index =0;

    if(rootObj.contains("nodes"))
    {
        QJsonArray subObj = rootObj.value("nodes").toArray();

        int len = subObj.size();
        for(int i=0;i<len;i++)
        {
        QJsonObject tempObj = subObj[i].toObject();
         qDebug() << "id is:"<<index++;
         qDebug() << "name is:"<<tempObj["name"].toString();
         qDebug() << "image is:" << tempObj["image"].toString();
         }
         //Node node_temp = Node(subObj["name"].toString(),subObj["image"].toString());
         //graph.getNodes().push_back(node_temp);
    }
    if(rootObj.contains("edges"))
    {
         QJsonArray subObj2 = rootObj.value("edges").toArray();
        int len = subObj2.size();
        for(int i=0;i<len;i++)
        {
          QJsonObject tempObj = subObj2[i].toObject();
          qDebug() << "source is:"<< tempObj["source"].toInt();
          qDebug() << "target is:" << tempObj["target"].toInt();
          qDebug() << "relation is:" << tempObj["relation"].toString();
        }
        //Edge edge_temp = Edge(subObj["source"].toInt(),subObj["target"].toInt(),subObj["relation"].toString());
        //graph.getEdges().push_back(edge_temp);
    }
    return true;
}

void FileProcess::writeJsonFile(QString name)
{

}


void FileProcess::addRole(QString name,QString Imagesource)
{
    QFile file(filePath);
    if(!file.open(QIODevice::ReadWrite)) {
        qDebug() << "打开文件失败";
    }

    if(root.contains("nodes"))
    {
        QJsonArray subObj = root.value("nodes").toArray();
        QJsonObject tempObj;

        Imagesource = Imagesource.mid(8,filePath.length()-7);
        tempObj.insert("image",Imagesource);

        tempObj.insert("name",name);

        subObj.append(tempObj);

        //文件清空
        file.resize(0);
        QJsonDocument jsonDoc;

        //重新建立 文件的root对象
        QJsonObject obj;

        obj.insert("edges", root.value("edges").toArray());
        obj.insert("nodes",subObj);

        root = obj;


        //写入json文件

        jsonDoc.setObject(obj);
        file.write(jsonDoc.toJson());

        file.flush();
        return;

    }
}
