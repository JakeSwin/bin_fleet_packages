FROM osrf/ros:foxy-desktop

RUN apt update

RUN bash -c "source /opt/ros/foxy/setup.bash"
WORKDIR /bin_fleet_ws
COPY . .
RUN rosdep update
RUN bash -c "rosdep install --from-paths src --ignore-src -r -y"
RUN bash -c "colcon build"
