# another reference https://erget.wordpress.com/2014/02/01/calibrating-a-stereo-camera-with-opencv/comment-page-1/#comment-496 where my chessbox image is obtained.

# build solution
mkdir build && cd build
cmake ..
make

# single camera calbration
# left camera

./calibrate -w 9 -h 6 -n 50 -s 0.0625 -d "../calib_imgs/4/" -i "left" -o "cam_left.yml" -e "jpg"

# right camera
./calibrate -w 9 -h 6 -n 50 -s 0.0625 -d "../calib_imgs/4/" -i "right" -o "cam_right.yml" -e "jpg"

# stereo calbration
./calibrate_stereo -n 50 -u "cam_left.yml" -v "cam_right.yml" -L "../calib_imgs/4/" -R "../calib_imgs/4/" -l left -r right -o "cam_stereo.yml"

#unrectify images
#./undistort_rectify -l [left_img_path] -r [right_img_path] -c [stereo_calib_file] -L [output_left_img] -R [output_right_img]
