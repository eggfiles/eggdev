#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>


class Controller : public QObject
{

    Q_OBJECT

    Q_PROPERTY(const int mSAFETYDISTANCE READ getSafetyDistance CONSTANT)     //CONSTANT at the end to avoid message "depends on non-notifyable properties"
    Q_PROPERTY(int m_distance MEMBER m_distance NOTIFY distanceChanged)       //use MEMBER or WRITE


public:
    Controller();
    virtual ~Controller();

    Q_INVOKABLE int getSafetyDistance(){return mSAFETYDISTANCE;}


public slots:
    Q_INVOKABLE void setDistance(int _distance);


signals:
    void distanceChanged(int _distance);


//////////      Member          //////////

private:
    const int    mSAFETYDISTANCE = 5;        //in meter
    int          m_distance = 10;

};

#endif // CONTROLLER_H
