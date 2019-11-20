#include "controller.h"

Controller::Controller()
{
}

Controller::~Controller()
{

}


void Controller::setDistance(int _distance)
{
    m_distance = _distance;
    emit distanceChanged(m_distance);
}

