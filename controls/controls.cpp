#include "controls.h"

Controls::Controls(QObject *parent)
    : QObject{parent}
    , m_currentTemp(25)
    , m_targetTemp(25)
    , m_statusMessage("Heating")
{
    chip = gpiod_chip_open("/dev/gpiochip0");
    if (!chip) {
        printf("Chip init is failed\n");
    } else {
        printf("Chip init success!\n");
    }

    line = gpiod_chip_get_line(chip, 14);
    if (!line) {
        printf("Line init failed\n");
    }

    rv = gpiod_line_request_output(line, "out_14", 0);
    if (rv) {
        printf("failed to configure line\n");
    }
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

void Controls::checkGPIOvalue() {
    int val;

    line = gpiod_chip_get_line(chip, 14);
    val = gpiod_line_get_value(line);
    if (val == 1)
    {
        gpiod_line_set_value(line, 0);
    }
}

void Controls::checkSaunaStatus()
{
    if ( m_currentTemp < m_targetTemp && m_currentTemp < (m_targetTemp - 5) ) {
        setStatusMessage("Heating");
        line = gpiod_chip_get_line(chip, 14);
        gpiod_line_set_value(line, 1);
    }
    else if ( m_currentTemp > m_targetTemp && m_currentTemp > (m_targetTemp + 5) ) {
        setStatusMessage("Cooling");
        checkGPIOvalue();
    }
    else {
        setStatusMessage("Idle");
        checkGPIOvalue();
    }
}
