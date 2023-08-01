#!/bin/bash

source /opt/ros/${ROS_DISTRO}/setup.bash \
    && rviz2 -d ${HOME}/rviz-config/polygon.rviz
