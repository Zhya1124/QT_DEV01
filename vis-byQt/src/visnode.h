//-----------------------------------------------------------------------------
// \file	VisNode.h
// \author	nw
// \date	2019 08 27
//-----------------------------------------------------------------------------

#ifndef VisNode_h
#define VisNode_h

// QuickQanava headers
#include <QuickQanava>

// Qt headers
#include <QQuickPaintedItem>

namespace qan { // ::qan

class VisNode : public qan::Node
{
    Q_OBJECT
public:
    explicit VisNode( QQuickItem* parent = nullptr );
    virtual ~VisNode();
private:
    Q_DISABLE_COPY( VisNode )
public:
    Q_PROPERTY( QUrl image READ getImage WRITE setImage NOTIFY imageChanged )
    const QUrl&         getImage() const noexcept { return _image; }
    void                setImage(QUrl image) noexcept;
private:
    QUrl        _image;
signals:
    void        imageChanged();

    /*! \name Node Static Factories *///---------------------------------------
    //@{
public:
    static  QQmlComponent*      delegate(QQmlEngine& engine) noexcept;
    //@}
    //-------------------------------------------------------------------------
};

class VisGraph : public qan::Graph
{
    Q_OBJECT
public:
    explicit VisGraph( QQuickItem* parent = nullptr ) noexcept : qan::Graph(parent) { }

public:
    Q_INVOKABLE qan::Node* insertVisNode() {
        return insertNode<VisNode>(nullptr);
    }
};

} // ::qan

QML_DECLARE_TYPE( qan::VisNode )
QML_DECLARE_TYPE( qan::VisGraph )

#endif // VisNode_h

