/********************************************************************************
* FaceTrackNoIR		This program is a private project of the some enthusiastic	*
*					gamers from Holland, who don't like to pay for				*
*					head-tracking.												*
*																				*
* Copyright (C) 2010	Wim Vriend (Developing)									*
*						Ron Hendriks (Researching and Testing)					*
*																				*
* Homepage																		*
*																				*
* This program is free software; you can redistribute it and/or modify it		*
* under the terms of the GNU General Public License as published by the			*
* Free Software Foundation; either version 3 of the License, or (at your		*
* option) any later version.													*
*																				*
* This program is distributed in the hope that it will be useful, but			*
* WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY	*
* or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for	*
* more details.																	*
*																				*
* You should have received a copy of the GNU General Public License along		*
* with this program; if not, see <http://www.gnu.org/licenses/>.				*
*																				*
* FGServer			FGServer is the Class, that communicates headpose-data		*
*					to FlightGear, using UDP.				         			*
*					It is based on the (Linux) example made by Melchior FRANZ.	*
********************************************************************************/
#pragma once
#ifndef INCLUDED_FGSERVER_H
#define INCLUDED_FGSERVER_H
 
#include "FGTypes.h"
#include <QString>
#include <QMessageBox>
#include <QSettings>
#include <QFile>
#include <QApplication>
#include <QDebug>
#include <QThread>
#include <QMutex>
#include <QLibrary>
#include <QUdpSocket>

using namespace std;

class Tracker;				// pre-define parent-class to avoid circular includes

class FGServer : public QThread {
	Q_OBJECT

public: 

	// public member methods
	FGServer( Tracker *parent );
	virtual ~FGServer() {};

	// protected member methods
protected:
	void run();
	void terminate();

private slots:
	void readPendingDatagrams();

private:
	// Handles to neatly terminate thread...
	HANDLE m_StopThread;
	HANDLE m_WaitThread;

	Tracker *headTracker;									// For upstream messages...
	TFlightGearData TestData;
	QUdpSocket *inSocket;									// Receive from FligthGear
	QUdpSocket *outSocket;									// Send to FligthGear
	qint32 fg_cmd;											// Command from FlightGear
	
	/** member variables for saving the head pose **/
	float virtPosX;
	float virtPosY;
	float virtPosZ;
	
	float virtRotX;
	float virtRotY;
	float virtRotZ;

public:
	void setVirtRotX(float rot) { virtRotX = rot; }
	void setVirtRotY(float rot) { virtRotY = rot; }
	void setVirtRotZ(float rot) { virtRotZ = rot; }
	void setVirtPosX(float pos) { virtPosX = pos; }
	void setVirtPosY(float pos) { virtPosY = pos; }
	void setVirtPosZ(float pos) { virtPosZ = pos; }

};


#endif//INCLUDED_FGSERVER_H
//END
