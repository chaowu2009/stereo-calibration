# another reference https://erget.wordpress.com/2014/02/01/calibrating-a-stereo-camera-with-opencv/comment-page-1/#comment-496 where my chessbox image is obtained.

# build solution
rebuild=0
if ($rebuild==1) then
    mkdir build
    cd build
    cmake ..
    make
fi


# single camera calbration
# left camera

build/calibrate -w 9 -h 6 -n 50 -s 0.0625 -d "calib_imgs/4/left/" -i "left" -o "cam_left.yml" -e "jpg"

# right camera
build/calibrate -w 9 -h 6 -n 50 -s 0.0625 -d "calib_imgs/4/right/" -i "right" -o "cam_right.yml" -e "jpg"

# stereo calbration
build/calibrate_stereo -n 50 -u "cam_left.yml" -v "cam_right.yml" -L "calib_imgs/4/left/" -R "calib_imgs/4/right/" -l left -r right -o "cam_stereo.yml"

#unrectify images
#./undistort_rectify -l [left_img_path] -r [right_img_path] -c [stereo_calib_file] -L [output_left_img] -R [output_right_img]
