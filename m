Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF027AC834
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 15:08:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0F845442F7
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 13:08:47 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	by lists.linaro.org (Postfix) with ESMTPS id E6EC840C17
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 13:08:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=EDoLC0N8;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.175 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690bd8f89baso3461649b3a.2
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695560918; x=1696165718; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MDNJDXW7eYgtZbRuK/v5AVHiUe1pWF40nA44SwFSMs=;
        b=EDoLC0N8BXzXJntgzR81SAf6+PHjrA9HCnf0U1fIzMe/vG4U6fpBQY+V10G3bL0w03
         jDr4on6Lh0sPGO8YBv0qpKySvLTHOB5Qop1Gv/z1Wr951DicwAoOG0iu60jeugGFDxwf
         VPnv+BNzFNYTWmx2K6r+49qanmrvMB6+uHDrGaIE5C9HjTdRbACT2+yUrby43+9l/0G7
         feBs9vQOuXhqy35UpLhFmje/QlK/FO2LYVb22t8DtYbZCSpkhxCB0p62tATna7CtOHc6
         JHkhQ/WjCaxNFrK1rAgzndl90kKu3EXY66C82Be39cBhvpTN6NNch4RqmP2Dk/Ue9ool
         Gpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695560918; x=1696165718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MDNJDXW7eYgtZbRuK/v5AVHiUe1pWF40nA44SwFSMs=;
        b=RjEvjQVCvJgIoZjU/NZlo5x1OuRhvN7HsNymsGtFnX9em/pJLknH5LwAwSlQBJDYrm
         C65fv/aXHGZ7+cnvHZpVQGJxGygzg9zvJRtQ2PSQ+zRTKix4mkqSV3SUFZW4WPM+Mwaz
         n3Sfb39tpVgveI1BrUE4oOD3WKM2u3fC65IkLbZN1TigxjbsOjOr7mk6lLbOCxTQMTz1
         dVgAo2GeXrp7ntiKQUVj/mcD3Pg4cWJH3uxGSx0fjkbPZTfkhMb3kjfX+DzvIF5e9rgl
         WZj3WXx+/EZ61KIv74zbGX0Qbcijvjbn0hz5qsUb4pNuBVzd34emiN4THabgwK3ZvtaA
         5PiA==
X-Gm-Message-State: AOJu0Ywxo8S/hdsAKfb9AH+gNhwtfNrkxkkhCDw+QHlaTaPF25o8jzYd
	/X6DEpCdFnXpXq1hAENY2TQ=
X-Google-Smtp-Source: AGHT+IHIQF9Tk5+ZLyiP8V1HkeUuxHs065A/VB0hZArVJ4KIbOv5iT5IOxZlV8tcvidoTDuuucEssA==
X-Received: by 2002:a05:6a00:1748:b0:690:c1a6:1c3b with SMTP id j8-20020a056a00174800b00690c1a61c3bmr3306583pfc.33.1695560917915;
        Sun, 24 Sep 2023 06:08:37 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id q16-20020a62e110000000b0069028bdd24dsm6305220pfh.34.2023.09.24.06.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 06:08:37 -0700 (PDT)
Message-ID: <36d8a626-f4a6-fe51-5726-be32aabd519d@gmail.com>
Date: Sun, 24 Sep 2023 18:38:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 greybus-dev@lists.linaro.org
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
 <20230924113725.164948-3-ayushdevel1325@gmail.com>
 <6ce74c42-d1d0-d9cb-9d90-68989933d1d4@linaro.org>
 <62f5671d-738b-997c-798f-7e6cc00f7ef9@gmail.com>
 <11888c25-466b-2c28-1265-578736182846@linaro.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <11888c25-466b-2c28-1265-578736182846@linaro.org>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.175:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E6EC840C17
Message-ID-Hash: EVKK44BK4TQJIQIZGXRJRE54U7LPMB7V
X-Message-ID-Hash: EVKK44BK4TQJIQIZGXRJRE54U7LPMB7V
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EVKK44BK4TQJIQIZGXRJRE54U7LPMB7V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


>>>> +	spinlock_t tx_producer_lock;
>>>> +	/* tx_consumer_lock: HDLC consumer lock */
>>>> +	spinlock_t tx_consumer_lock;
>>>> +	struct circ_buf tx_circ_buf;
>>>> +	u16 tx_crc;
>>>> +	u8 tx_ack_seq;
>>>> +
>>>> +	u16 rx_buffer_len;
>>>> +	u8 rx_in_esc;
>>>> +	u8 rx_buffer[MAX_RX_HDLC];
>>>> +};
>>>> +
>>>> +struct hdlc_payload {
>>>> +	u16 length;
>>>> +	void *payload;
>>>> +};
>>>> +
>>> ...
>>>
>>>> +
>>>> +static int gb_serdev_init(struct gb_beagleplay *bg)
>>>> +{
>>>> +	u32 speed = 115200;
>>>> +	int ret;
>>>> +
>>>> +	serdev_device_set_drvdata(bg->serdev, bg);
>>>> +	serdev_device_set_client_ops(bg->serdev, &gb_beagleplay_ops);
>>>> +	ret = serdev_device_open(bg->serdev);
>>>> +	if (ret) {
>>>> +		return dev_err_probe(&bg->serdev->dev, ret,
>>>> +				     "Unable to Open Serial Device");
>>>> +	}
>>> Please run scripts/checkpatch.pl --strict and fix reported warnings.
>>> Some warnings can be ignored, but the code here looks like it needs a
>>> fix. Feel free to get in touch if the warning is not clear.
>> So I do not actually get any errors here in checkpatch. I am running the
>> follwing:
>>
>> `scripts/checkpatch.pl --codespell --strict patch/*`
>>
>> I only get a warning in coverletter due to that path of DT bindings
>> being more than 75 character long and ` Lines should not end with a '('`.
>>
>>>> +	if (!bg)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	bg->serdev = serdev;
>>>> +	ret = gb_serdev_init(bg);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = hdlc_init(bg);
>>>> +	if (ret)
>>>> +		goto free_serdev;
>>>> +
>>>> +	ret = gb_greybus_init(bg);
>>>> +	if (ret)
>>>> +		goto free_hdlc;
>>>> +
>>>> +	gb_beagleplay_start_svc(bg);
>>>> +
>>>> +	return 0;
>>>> +
>>>> +free_hdlc:
>>>> +	hdlc_deinit(bg);
>>>> +free_serdev:
>>>> +	gb_serdev_deinit(bg);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void gb_beagleplay_remove(struct serdev_device *serdev)
>>>> +{
>>>> +	struct gb_beagleplay *bg = serdev_device_get_drvdata(serdev);
>>>> +
>>>> +	gb_greybus_deinit(bg);
>>>> +	gb_beagleplay_stop_svc(bg);
>>>> +	hdlc_deinit(bg);
>>>> +	gb_serdev_deinit(bg);
>>>> +}
>>>> +
>>>> +static const struct of_device_id gb_beagleplay_of_match[] = {
>>>> +	{
>>>> +		.compatible = "beagle,play-cc1352",
>>>> +	},
>>>> +	{},
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, gb_beagleplay_of_match);
>>>> +
>>>> +static struct serdev_device_driver gb_beagleplay_driver = {
>>>> +	.probe = gb_beagleplay_probe,
>>>> +	.remove = gb_beagleplay_remove,
>>>> +	.driver = {
>>>> +	      .name = "gb_beagleplay",
>>>> +	      .of_match_table = gb_beagleplay_of_match,
>>> This is still wrongly aligned. Spaces after tab. Are you sure checkpatch
>>> does not complain bout it?
>> Again, it doesn't seem to for me. Am I missing some environment
>> variables or options? Or maybe something wrong with my editor config
>> (neovim)?
> You have spaces after tab, so how can this be properly aligned?

Well, I will try to fix all of them. They might be remnants from when I 
was developing this out-of-tree. Still, it's strange for checkpatch to 
not complain. Will look into that as well if I get time.


Yours Sincerely,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
