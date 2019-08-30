//-----------------------------------------------------------------------------
// \file	qanVisNode.cpp
// \author	nw
// \date	2019 08 27
//-----------------------------------------------------------------------------

// QuickQanava headers
#include "../../src/QuickQanava.h"
#include "./VisNode.h"

namespace qan { // ::qan

VisNode::VisNode( QQuickItem* parent ) :
    qan::Node( parent )
{

}

VisNode::~VisNode() { /* Nil */ }

QQmlComponent*  VisNode::delegate(QQmlEngine& engine) noexcept
{
    static std::unique_ptr<QQmlComponent>   delegate;
    if ( !delegate )
        delegate = std::make_unique<QQmlComponent>(&engine, "qrc:/qml/Cirimg.qml");
    return delegate.get();
}

void    VisNode::setImage(QUrl image) noexcept
{
    if ( image != _image ) {
        _image = image;
        setLabel(image.toString());
        emit imageChanged();
    }
}
} // ::qan
