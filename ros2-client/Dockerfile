ARG ROS_DISTRO=foxy
FROM osrf/ros:${ROS_DISTRO}-desktop

ENV ROS_WS=/root/ros2_ws

RUN apt update -y \
    && apt install -y python3-pip \
    && rm -rf /var/lib/apt/lists/*

# File is executed by ENTRYPOINT
RUN sed --in-place \
    's|^source .*|\0\nsource "${ROS_WS}/install/setup.bash"|' \
    /ros_entrypoint.sh \
    && echo "source /ros_entrypoint.sh" >> /root/.bashrc

RUN pip3 install requests

WORKDIR ${ROS_WS}

COPY ros2_ws ${ROS_WS}

RUN colcon build

CMD ros2 run polygon_map polygon_subscriber
