import Rails from "@rails/ujs"
import 'tui-time-picker/dist/tui-time-picker.css';
import "tui-calendar/dist/tui-calendar.css";
import Calendar from "tui-calendar";

import { Controller } from "stimulus"
export default class extends Controller {
    getCalendardata(){
        var schedules = JSON.parse(document.querySelector("#calendar").dataset.schedules);
        window.schedules = schedules;
        schedules.forEach(schedule => {
        this.calendar.createSchedules([
        {
          id: schedule.id,
          calendarId: '1',
          title: schedule.title,
          category: 'time',
          dueDateClass: schedule.dueDateClass,
          location: schedule.location,
          start: schedule.start,
          end: schedule.end
        }
        ])
        });
      }
    connect() {
        calendar = new Calendar(document.getElementById('calendar'), {
            id: "1",
            name: "My Calendar",
            defaultView: 'month',
            color: '#00a9ff',
            bgColor: '#00a9ff',
            dragBgColor: '#00a9ff',
            borderColor: 'red',

            milestone: true,    // Can be also ['milestone', 'task']
            scheduleView: true,  // Can be also ['allday', 'time']
            useCreationPopup: true,
            useDetailPopup: true,
            template: {

            popupDetailRepeat: function(schedule) {
                return 'Repeat : ' + schedule.recurrenceRule;
            },

            popupStateFree: function() {
                return 'Free';
            },
                milestone: function(schedule) {
                    return '<span style="color:red;"><i class="fa fa-flag"></i> ' + schedule.title + '</span>';
                },
                milestoneTitle: function() {
                    return 'Milestone';
                },
                task: function(schedule) {
                    return '&nbsp;&nbsp;#' + schedule.title;
                },
                taskTitle: function() {
                    return '<label><input type="checkbox" />Task</label>';
                },
                allday: function(schedule) {
                    return schedule.title + ' <i class="fa fa-refresh"></i>';
                },
                alldayTitle: function() {
                    return 'All Day';
                },
                time: function(schedule) {
                    return schedule.title + ' <i class="fa fa-refresh"></i>' + schedule.start;
                }
            },
            month: {
                daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                startDayOfWeek: 0,
                narrowWeekend: true
            },
            week: {
                daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                startDayOfWeek: 0,
                narrowWeekend: true
            }
        });
        this.getCalendardata()
    }
}