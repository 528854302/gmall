package com.a528854302.gmall.auth.service;

import java.awt.image.BufferedImage;

public interface CaptchaService {
    boolean check(String uuid, String kaptcha);

    BufferedImage getCaptcha(String uuid);
}
