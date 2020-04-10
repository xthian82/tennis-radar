//
//  CalendarPickController.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/31/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import KDCalendar

protocol CalendarPickControllerDelegate : NSObjectProtocol{
    func handleSelection(data: String)
}

class CalendarPickController: UIViewController, CalendarViewDataSource, CalendarViewDelegate {
    
    @IBOutlet weak var calendarView: CalendarView!
    weak var delegate : CalendarPickControllerDelegate?
    let formatter = DateFormatter()
    
    override func viewWillAppear(_ animated: Bool) {
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
    }
    
    func endDate() -> Date {
        let today = Date()
        
        return today
    }
    
    func headerString(_ input: Date) -> String? {
        formatter.dateFormat = Constants.MMMMyyyyFormat
        return formatter.string(from: input)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myStyle = CalendarView.Style()
        myStyle.cellTextColorWeekend = UIColor.systemOrange
        myStyle.cellColorOutOfRange = UIColor.lightGray
        myStyle.cellColorToday = UIColor.white
        myStyle.cellFont = UIFont(name: "Futura", size: 15)!

        // set your values
        calendarView.style = myStyle
        calendarView.marksWeekends = true
        calendarView.multipleSelectionEnable = false
        calendarView.dataSource = self
        calendarView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let today = Date()
        self.calendarView.setDisplayDate(today, animated: false)
    }
    
    func startDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = -24
        return self.calendarView.calendar.date(byAdding: dateComponents, to: Date())!
    }
    
    func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {
    
    }
    
    func calendar(_ calendar: CalendarView, didSelectDate date: Date, withEvents events: [CalendarEvent]) {
        if let delegate = delegate {
            formatter.dateFormat = Constants.yyyyMMddFormat
            delegate.handleSelection(data: formatter.string(from: date))
        }
        dismiss(animated: true, completion: nil)
    }
    
    func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {
    
    }
    
    func calendar(_ calendar: CalendarView, didLongPressDate date: Date, withEvents events: [CalendarEvent]?) {
        
    }
    
}
