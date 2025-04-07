Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBAA7DD40
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Apr 2025 14:10:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D6BFE410D7
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Apr 2025 12:10:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	by lists.linaro.org (Postfix) with ESMTPS id 1DE233E80D
	for <greybus-dev@lists.linaro.org>; Mon,  7 Apr 2025 07:14:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=zVwri2uq;
	spf=none (lists.linaro.org: domain of brgl@bgdev.pl has no SPF policy when checking 209.85.221.45) smtp.mailfrom=brgl@bgdev.pl;
	dmarc=none
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so3461301f8f.3
        for <greybus-dev@lists.linaro.org>; Mon, 07 Apr 2025 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010098; x=1744614898; darn=lists.linaro.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQJq7bLNv9KR26qv53DN+VLCkGsehwu1X3TDIPfPRkk=;
        b=zVwri2uq6kd7zuraXkNGKEMVg443naReRggbAA4an16YXRVSrLfdpXKtHeoliU8KFt
         GpIDlZDSINAN+Oi8B+UBnM8oXLBVZ3gQLMT5F6aBsgpu0mbMaZa/MOClzKpoobwMlH9Y
         gXrzjnq01hO7xyMF3kov+1JSsIsyTuwTToa0AaCMe6x4X6lENX6ffDxSLRfOWp91Ttum
         XKUQDWjP2F/c49RpeZ06D7VvIHGkIOc/kIMSJS8Sk2jYOP9FQjlLCoaRT+2CWsr/U3Lm
         pri+OS6B/iwL3MypqJ13wdMHMI1wlt35sR+aCLGEkSTlkLMJA05F9iL72kBeSmwneO93
         CJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010098; x=1744614898;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQJq7bLNv9KR26qv53DN+VLCkGsehwu1X3TDIPfPRkk=;
        b=VQ48AMCBfY5d0Tp8SouhouAb1w9p5bzXWRk9qzmrX0mKcBnjqOh9eaoQ5o7fURHqQN
         GYV1EiWoPLKaomIrZQqlI/vGoTLVDtktzJ1iISAr8NVOvbWS94Efby8Zxs5MKNmSwQJp
         dFKfvjolH/bHuuDrclv2YvFyH9gckr3yBpx3DOwa6V/uKEpkXqwe3MQZqjW+OUVNxCV0
         TFVx5JJla++zuk2Xo+FX73dlaPXZXS5F8ux0loPlMw65Vxhhl/s6kxWN95lQ296u488W
         X5Ja6lxMYYuRRaToF63AXRrJ0Jmpt7AwsNWUVjGSpKAgPfv+lOg0i+MZkurqar3Ju7JN
         0TSA==
X-Gm-Message-State: AOJu0YxkzvnZOQJBrqvHx58rb8oBrwyMvUDWsUmjLPYibRpRXXs+6NUK
	6rhKyH6MP6cdVe4LM4eOxjn0sfuCsLk6rLMMngNY66S7HC3WsmP6FWctZPjpisA=
X-Gm-Gg: ASbGncvNmgRjDXLfaWv1QlePtzJQTdzGzQUr/4aZtUmzrbvAKQHPyaz7OsMVaka0jJd
	AU1VTSN6yF9MJBXUim7AeQyc1fj+5Xb9oRoW7JNvmNeQh4leYRt69u33nEbI59g6bGnAMPKU9n5
	GjXdu83uj8MVTkmRupJZKupmZ7z4fLBhMeOphqNlzkoIUB9EbDnXrgKR5mYB6xK8w279/vj3xR+
	gFroyMPlFYD63v/+iXFI+F7JnSvkZX7Wuu6g23fUmY7RrZuZgw3E0XNcZGcTaw2EAK4Xi/fPUAL
	tqVcP/esCMYJjcHzVdQw9gHPPxkShliha5O03nLXsQk+b2Fp
X-Google-Smtp-Source: AGHT+IGP9iEwmcI9KW5YLuJo4zjunZA/QstskF0EVDjIclE0IgMIg3XGRl/bwqpue/ansqOprhfVRQ==
X-Received: by 2002:adf:9dc7:0:b0:39d:724f:a8a0 with SMTP id ffacd0b85a97d-39d724faacamr4274025f8f.58.1744010098097;
        Mon, 07 Apr 2025 00:14:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d9cfsm11171239f8f.78.2025.04.07.00.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:14:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:14:52 +0200
MIME-Version: 1.0
Message-Id: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGt782cC/x3MwQ5FMBBA0V+RWZtE2xR5v/JiQY2aDc0MQsS/a
 yzP4t4blIRJ4VfcIHSw8rpkmLKAMPdLJOQxG2xlfeWcwZh4DTMnVNpQDoxC17ArhtG62jfem7a
 GXCehic/v/O+e5wUCf6oOaQAAAA==
To: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lyZeQa2YMvW1R6DaShLQf+xZvZ4ShyP+YJTcj58/Ae4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83txCrzzqktCdet4fuf9XzYf1ZwcHfntFZErp
 4ADsauyzUWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7cQAKCRARpy6gFHHX
 crAVD/9D1veSf7MDcWSr/6lqGTLb4aG6bDhwc7mW048pgU9xifNfOp8SgOzPHGGHRX6urg7Z/gk
 yd4lESSeEbkVRk+LdBIBFG6CZO2lcui2De1CMRvfwVi9KfazF8rHM1kqjSGD2XlVi5xxSDCi1FT
 usxfWpsVl2DOYO/Hh7UZ4YXfp1az0nPbSBSagjvtvxNVilWo0FXWS0Nh0E/lfoE7tGZJupTzkX3
 SLaVQcLtSYqtMOWM7U3uLFBm9NRRto74njjuWdjTVzHzlWHp9BxC4abWwUstkHRrc92CsE/Z+A7
 Ika8DzpqQKLXo0+Q4CpHmWDH/NKAjQsXSPnn6KtETA01GEs2f/JDxoTzo+v9oNXXagI+M7GWHKD
 k9z0fCb0lx/Yz1vQ34RDduoj0bJinM5068EedFCEIpRjXCaEcJcmobGrTXuxWHDA1S0RvgUO28E
 Uv6/v9qf0AmYdKBx7qwNpQ9U4kPFcmUH7xvG/RlLfMHSlcbSNMcRnulKXZqIXTKw+oTqkYriapo
 BCcefKnwzNERsenbpiVUVs1gBt0yVDMCPLDXbZUeTdM2ZEKL4k7qcNxuNE7g6UCF+bVD8/Wa7rl
 ntFFQYrgQSOSU211+Su3ufTL1N0h0yjF+6TnWaU85AJKfK/GxikZEjc4C4D6ySOJH10vZqqY3Gc
 4TYOf8py0zESLYg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Rspamd-Queue-Id: 1DE233E80D
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	R_DKIM_ALLOW(-0.20)[bgdev-pl.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.45:from];
	R_SPF_NA(0.00)[no SPF record];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,linaro.org,bgdev.pl];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.221.45:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	DMARC_NA(0.00)[bgdev.pl: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[209.85.221.45:from,2a01:cb1d:dc:7e00:8c64:734d:705a:39a7:received];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[bgdev-pl.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AC3VZL4UDAGP6OEWZJBSHGMJLKCU66DD
X-Message-ID-Hash: AC3VZL4UDAGP6OEWZJBSHGMJLKCU66DD
X-Mailman-Approved-At: Mon, 07 Apr 2025 12:10:30 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: use new GPIO line value setter callbacks
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AC3VZL4UDAGP6OEWZJBSHGMJLKCU66DD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/staging/greybus/gpio.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 16bcf7fc8158..f81c34160f72 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpio_controller *ggc,
 	return 0;
 }
 
-static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
-					u8 which, bool value_high)
+static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
+				       u8 which, bool value_high)
 {
 	struct device *dev = &ggc->gbphy_dev->dev;
 	struct gb_gpio_set_value_request request;
@@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
 	if (ggc->lines[which].direction == 1) {
 		dev_warn(dev, "refusing to set value of input gpio %u\n",
 			 which);
-		return;
+		return -EPERM;
 	}
 
 	request.which = which;
@@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
 				&request, sizeof(request), NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to set value of gpio %u\n", which);
-		return;
+		return ret;
 	}
 
 	ggc->lines[which].value = request.value;
+
+	return 0;
 }
 
 static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *ggc,
@@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return ggc->lines[which].value;
 }
 
-static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
-	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
+	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
 }
 
 static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
 	gpio->direction_input = gb_gpio_direction_input;
 	gpio->direction_output = gb_gpio_direction_output;
 	gpio->get = gb_gpio_get;
-	gpio->set = gb_gpio_set;
+	gpio->set_rv = gb_gpio_set;
 	gpio->set_config = gb_gpio_set_config;
 	gpio->base = -1;		/* Allocate base dynamically */
 	gpio->ngpio = ggc->line_max + 1;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
