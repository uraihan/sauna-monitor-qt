#include "controls.h"

Controls::Controls(QObject *parent)
    : QObject{parent}
    , m_currentTemp(50)
    , m_targetTemp(70)
    , m_statusMessage("Heating")
{

}

int Controls::currentTemp() const
{
    return m_currentTemp;
}

void Controls::setCurrentTemp(int newCurrentTemp)
{
    if (m_currentTemp == newCurrentTemp)
        return;
    m_currentTemp = newCurrentTemp;
    emit currentTempChanged();
}

int Controls::targetTemp() const
{
    return m_targetTemp;
}

void Controls::setTargetTemp(int newTargetTemp)
{
    if (m_targetTemp == newTargetTemp)
        return;
    m_targetTemp = newTargetTemp;
    emit targetTempChanged();
    checkSaunaStatus();
}

QString Controls::statusMessage() const
{
    return m_statusMessage;
}

void Controls::setStatusMessage(QString newStatusMessage)
{
    if (m_statusMessage == newStatusMessage)
        return;
    m_statusMessage = newStatusMessage;
    emit statusMessageChanged();
}

Controls::HeatingState Controls::saunaState() const
{
    return m_saunaState;
}

void Controls::setSaunaState(HeatingState newSaunaState)
{
    if (m_saunaState == newSaunaState)
        return;
    m_saunaState = newSaunaState;
    emit saunaStateChanged();
    checkSaunaStatus();
}

void Controls::checkSaunaStatus()
{
    if ( m_currentTemp < m_targetTemp )
        setStatusMessage("Heating");
    else if ( m_currentTemp > m_targetTemp )
        setStatusMessage("Cooling");
    else
        setStatusMessage("Idle");
}
