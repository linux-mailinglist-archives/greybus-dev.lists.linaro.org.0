Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 194787B490A
	for <lists+greybus-dev@lfdr.de>; Sun,  1 Oct 2023 20:13:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AE64640F0B
	for <lists+greybus-dev@lfdr.de>; Sun,  1 Oct 2023 18:13:52 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id E840A3EFE8
	for <greybus-dev@lists.linaro.org>; Sun,  1 Oct 2023 18:13:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="Ye9/+tV7";
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690bfd4f3ebso12408475b3a.3
        for <greybus-dev@lists.linaro.org>; Sun, 01 Oct 2023 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696184024; x=1696788824; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMj01fiCMchmpOFI6pg14GedO51sLHMCkjaQsCK6pDM=;
        b=Ye9/+tV75V8eZ4XJn4U5SaEX7UrpxpNdpqjzz3kJRKbSj38bMuW/Hb6p20iribgrMy
         I89UTEldiwU3x9hb1Odoo5Nj3WY2xmNNU4uIs68hevTuShcrAIUtDXagFZV7wkQTYKPx
         qwCvZ8UZ+vYL1QqQg44ZtMODDDJ/3atPWA7NnWzhGV6dyuHGOfiuOwHxfxoyICqusrKd
         ++kC4MI0E9Q7chs6VvLNG9jxmKLGkXIRFqdcp+mDjaDs1tu5xNUjgq7yKlOUtGoO3WSz
         BdEVEBjqDOjC2uQygwG/Axx39hd+TXz6KugLPuKDsZYH2eGmLGEhnTteFvasKiYGx+SZ
         SuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696184024; x=1696788824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMj01fiCMchmpOFI6pg14GedO51sLHMCkjaQsCK6pDM=;
        b=vPXVho19lr+oEH3DFLfwbVns6A/+eczCLKPkhCkUrWtTWV0n35wOhx6RnUCztgBzcm
         jweo7um23FBmQrWzXKJ5JXcayCVUrW+zRyP2SShVZwDqRkr6DTy/XWICikhpDwxJ9y8C
         rKELVVgkqBt8dgyZC74oDO8L2PjECx6R0HatwjNQquOz7Hb9TsferUhTYBAQ9rgtgSK9
         Uir5GgwvbJwYHOBbMRsyG/aB794RPJu7Ixait6Cx+MI/LkkV8gZJ3OHx8rBkpGzukemC
         9W2Jx3FWb3SlusFAujAfBDkHjz6lgMazj8w91a0DTTs5xhPAA9hJLd9mctS6k1roarvD
         Lz8w==
X-Gm-Message-State: AOJu0Yz6S3JcExHMyqUzP6Gc2nSsOZEYYcLWgwfEvBRgbsjuWmyGzjmz
	mEuFG9bExlN6hoCMpqN9LTs=
X-Google-Smtp-Source: AGHT+IH+QzGsLJ3GCTpB6XfJ4ivzoU357fMauno1Q+QAtY+opNqUqihkD2RFpKSnRz/tRFolPHYyEQ==
X-Received: by 2002:a05:6a00:2341:b0:68c:4e22:8f78 with SMTP id j1-20020a056a00234100b0068c4e228f78mr9219967pfj.25.1696184023793;
        Sun, 01 Oct 2023 11:13:43 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id q25-20020a62e119000000b0069337938be8sm7729216pfh.110.2023.10.01.11.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Oct 2023 11:13:43 -0700 (PDT)
Message-ID: <66fbd8d1-8b1a-50b5-c442-23847dc3d42f@gmail.com>
Date: Sun, 1 Oct 2023 23:43:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 greybus-dev@lists.linaro.org
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
 <20230924113725.164948-3-ayushdevel1325@gmail.com>
 <6ce74c42-d1d0-d9cb-9d90-68989933d1d4@linaro.org>
 <62f5671d-738b-997c-798f-7e6cc00f7ef9@gmail.com>
 <11888c25-466b-2c28-1265-578736182846@linaro.org>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <11888c25-466b-2c28-1265-578736182846@linaro.org>
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.172:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E840A3EFE8
Message-ID-Hash: 7DXNFBOVVIP6R7PIMEN5KITTGICB6XPY
X-Message-ID-Hash: 7DXNFBOVVIP6R7PIMEN5KITTGICB6XPY
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7DXNFBOVVIP6R7PIMEN5KITTGICB6XPY/>
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
>
> Best regards,
> Krzysztof
>
So I just wanted to confirm, but I think spaces after tab are fine for 
alignment, right? I found this 
(https://www.mail-archive.com/kernelnewbies@kernelnewbies.org/msg13354.html) 
message in mailing list stating that it is fine.

It seems clang-format adds spaces for alignment less than 8 spaces. And 
checkpatch doesn't seem to complain as long as spaces are used for 
alignment (not indentation).


Sincerely,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
