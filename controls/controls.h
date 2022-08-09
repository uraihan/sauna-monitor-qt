#ifndef CONTROLS_H
#define CONTROLS_H

#include <QObject>
#include <gpiod.h>

class Controls : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentTemp READ currentTemp WRITE setCurrentTemp NOTIFY currentTempChanged)
    Q_PROPERTY(int targetTemp READ targetTemp WRITE setTargetTemp NOTIFY targetTempChanged)
    Q_PROPERTY(QString statusMessage READ statusMessage WRITE setStatusMessage NOTIFY statusMessageChanged)
    Q_PROPERTY(HeatingState saunaState READ saunaState WRITE setSaunaState NOTIFY saunaStateChanged)

public:
    explicit Controls(QObject *parent = nullptr);

    enum HeatingState {
        HEATING,
        COOLING,
        IDLE
    };
    Q_ENUM(HeatingState)

    int currentTemp() const;
    int targetTemp() const;
    QString statusMessage() const;
    HeatingState saunaState() const;

public slots:
    void setCurrentTemp(int CurrentTemp);
    void setTargetTemp(int TargetTemp);
    void setStatusMessage(QString StatusMessage);
    void setSaunaState(Controls::HeatingState SaunaState);
    void checkGPIOvalue();

signals:

    void currentTempChanged();
    void targetTempChanged();
    void statusMessageChanged();
    void saunaStateChanged();

private:
    struct gpiod_chip *chip;
    struct gpiod_line *line;
    int rv;
    void checkSaunaStatus();
    int m_currentTemp;
    int m_targetTemp;
    QString m_statusMessage;
    HeatingState m_saunaState;
};

#endif // Controls_H
