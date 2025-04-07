Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B919A7E057
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Apr 2025 16:03:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 172C23E80D
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Apr 2025 14:03:45 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	by lists.linaro.org (Postfix) with ESMTPS id 55FA03E80D
	for <greybus-dev@lists.linaro.org>; Mon,  7 Apr 2025 14:03:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ZHMWL5LR;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.221.42 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0dfba946so2745375f8f.3
        for <greybus-dev@lists.linaro.org>; Mon, 07 Apr 2025 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744034617; x=1744639417; darn=lists.linaro.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIlvgpw9XtwUaSV8K9n4TGTxcXwBT3cWEpS99F1AqXk=;
        b=ZHMWL5LRbOKN7qfxy1fVApaz9FX/FBRzIT4OkTThfpJidgbwekTm2JyExEuy1iC/sc
         qs/uex2O1QZYSEECol69/ZNHVBElGVsCjXKpyz2jDdaZDltczV4G4+pqRSJRZhAUIah7
         4OQGRv6N4AF2PNrM0hObr9ojWPT58sKkTqvw7/T0jhPHpm0/ycdwtOBYk6qbUeX7YeFT
         D5aRd5w+DFxZzxZI/Qwyp6GYfj9wie6NvSGh10c2PsHY/PhekfCGuBhG9hFMkQ52+tLE
         yCpIRkjnkeAqk7etfP5Z7ERVyZTQ+KhLvw6h03dsoZBRBuizlPtkQZlFiB/xquqbV9fL
         Wa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744034617; x=1744639417;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IIlvgpw9XtwUaSV8K9n4TGTxcXwBT3cWEpS99F1AqXk=;
        b=pwbqXmlhfUVTKRhVIZ0HGtUBGH3dBlmPaJwoUX3Dm6Hsy7Xks3wPRDAqd+9CiqEbmE
         qikfFmQkWBDa7ceK6I/hD1tbaS8D7nNdzGZunzJbEFxkSIhyj4cHEcD1HqsWVRfoYp7A
         OtJpJhS2U4c0ppzOvPsYl6Kwwi9yKcD+PC3HXrgMdn7PGgyOH3viP8Pk6ADk2ylD43F0
         eBJnk/UpQxskFJUyt5KsjEhSscAeIjwVpNxZngLzC0+T+8a9VrYH2Q5lF+Yjf5iWPHRE
         D+9BUnmLzLEXH3D90G3432q/XWzn0Hzh9Dn5p39iQb97HtyfJGAKVdi/K/IgNiRAb7XG
         c0Xg==
X-Gm-Message-State: AOJu0YyLFLggPQ80Tfyk1PiAzb2thQlGrHL+IgJt1uhTPLM8Qw/+/j9Z
	Kpy7gBVshmNEGmbCz24ON+mzaeH+Hd9BKXahcv8VyJXkNDo/cojB
X-Gm-Gg: ASbGncuNbO37kIqsqzHgKyRPGxinxzjOLiPzpmKDFJvGllBNvIaxdL9jAFs7VEhCk+r
	RnJ5mG42PWQkAyr1X6Kh+PiPHzLYImzOF6SVYPbuk6q4AC8DzSLLJZv1GLdN96a++DBKOh1iwcj
	AWVZx2bcBp8Fxlg2SpKTbS84l+Hy7OtI4h0mnGC6+4qmsVuaR2ncG4HtUWWT0O0sz3wtuQPk/2G
	72QyPBgFD3lxwTBWW9ICcCP4T7pRAFthBhyYxHZg3p9MNt4NibhKkEJStUlYV2Xhl9oww0zxsv3
	6sVKOQYRZ7ONebnGoKGPb/11ZoPKty6nOngKSjp2pEZFr9et105vwEMBqzvDj/3QcX1UdA==
X-Google-Smtp-Source: AGHT+IEn+6ojavR6tMMafF+SmH0WwvgludvtbX1hi0lpL0Cl0TXhJ1J3Nf3kTI2WVfqKrE0IPj037Q==
X-Received: by 2002:a5d:648b:0:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39cb35aa6ffmr10795285f8f.34.1744034615187;
        Mon, 07 Apr 2025 07:03:35 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30226b23sm12049412f8f.86.2025.04.07.07.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:03:34 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Date: Mon, 07 Apr 2025 15:03:33 +0100
Message-Id: <D90GO8QLAESS.PN6CB62OS6OY@linaro.com>
To: "Alex Elder" <elder@riscstar.com>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, "Rui Miguel Silva" <rmfrfs@gmail.com>, "Johan Hovold"
 <johan@kernel.org>, "Alex Elder" <elder@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Linus Walleij" <linus.walleij@linaro.org>
References: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
 <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>
In-Reply-To: <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>
X-Rspamd-Queue-Id: 55FA03E80D
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[209.85.221.42:from];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[riscstar.com,bgdev.pl,gmail.com,kernel.org,linuxfoundation.org,linaro.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.42:from];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: AGDXMOJEFVBRWQXZNLZOBLOBQWC3C3MQ
X-Message-ID-Hash: AGDXMOJEFVBRWQXZNLZOBLOBQWC3C3MQ
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: use new GPIO line value setter callbacks
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AGDXMOJEFVBRWQXZNLZOBLOBQWC3C3MQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Bartosz,
Thanks for the patch.

On Mon Apr 7, 2025 at 2:49 PM WEST, Alex Elder wrote:

> On 4/7/25 2:14 AM, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> 
>> struct gpio_chip now has callbacks for setting line values that return
>> an integer, allowing to indicate failures. Convert the driver to using
>> them.
>> 
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Here is the commit that enabled these:
>    98ce1eb1fd87e gpiolib: introduce gpio_chip setters that return values
>
> This looks good.  Thank you.
>
> Reviewed-by: Alex Elder <elder@riscstar.com>

Agree with Alex.
LGTM.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
   Rui
>
>> ---
>>   drivers/staging/greybus/gpio.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
>> index 16bcf7fc8158..f81c34160f72 100644
>> --- a/drivers/staging/greybus/gpio.c
>> +++ b/drivers/staging/greybus/gpio.c
>> @@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpio_controller *ggc,
>>   	return 0;
>>   }
>>   
>> -static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>> -					u8 which, bool value_high)
>> +static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>> +				       u8 which, bool value_high)
>>   {
>>   	struct device *dev = &ggc->gbphy_dev->dev;
>>   	struct gb_gpio_set_value_request request;
>> @@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>>   	if (ggc->lines[which].direction == 1) {
>>   		dev_warn(dev, "refusing to set value of input gpio %u\n",
>>   			 which);
>> -		return;
>> +		return -EPERM;
>>   	}
>>   
>>   	request.which = which;
>> @@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>>   				&request, sizeof(request), NULL, 0);
>>   	if (ret) {
>>   		dev_err(dev, "failed to set value of gpio %u\n", which);
>> -		return;
>> +		return ret;
>>   	}
>>   
>>   	ggc->lines[which].value = request.value;
>> +
>> +	return 0;
>>   }
>>   
>>   static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *ggc,
>> @@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
>>   	return ggc->lines[which].value;
>>   }
>>   
>> -static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>> +static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>>   {
>>   	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
>>   
>> -	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>> +	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>>   }
>>   
>>   static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
>> @@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
>>   	gpio->direction_input = gb_gpio_direction_input;
>>   	gpio->direction_output = gb_gpio_direction_output;
>>   	gpio->get = gb_gpio_get;
>> -	gpio->set = gb_gpio_set;
>> +	gpio->set_rv = gb_gpio_set;
>>   	gpio->set_config = gb_gpio_set_config;
>>   	gpio->base = -1;		/* Allocate base dynamically */
>>   	gpio->ngpio = ggc->line_max + 1;
>> 
>> ---
>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186
>> 
>> Best regards,



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
