Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E0687DA39
	for <lists+greybus-dev@lfdr.de>; Sat, 16 Mar 2024 14:07:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2E608451C2
	for <lists+greybus-dev@lfdr.de>; Sat, 16 Mar 2024 13:07:12 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by lists.linaro.org (Postfix) with ESMTPS id 6D4303F368
	for <greybus-dev@lists.linaro.org>; Sat, 16 Mar 2024 13:07:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="P/PYureF";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.178 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d944e8f367so22662585ad.0
        for <greybus-dev@lists.linaro.org>; Sat, 16 Mar 2024 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710594428; x=1711199228; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O29l49W9XGARXAl4J0N7LLsgN9XT4ySMJ5Apk0iOPvg=;
        b=P/PYureFd3uUZ4SctbiDb7U0RSm8FFVRCx+fUNSxrO1EIMu/HjaGXn2f5sbIxLV+wE
         /46gBW1oEW7X9cekSpve8+8b6X+/ld5Eo0njVMmAZLrfJR49PRrpyeyB6s7iy1KvgPHH
         jeL70c+lm487uW1Vym8sQrcVH0J6z5MpWOH+nL5qHR4GxEJIaG3cvbLkPTWtONW+6Bk+
         xXyzzy0TXb8DQDJBnWzvVIXLf9ocA4S5F3VzrEdYK6jUmVX/ySaIfWzfvp0MBM+5Wr3I
         TO8877VFy+qAn2SweZIrA+h2/wH/90NTnNswoJYcqaMCru88oK45AFz6mt5JaDYCueJZ
         ySfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710594428; x=1711199228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O29l49W9XGARXAl4J0N7LLsgN9XT4ySMJ5Apk0iOPvg=;
        b=e1iqFAKgShrq3JZyikj0VvbXzxsw59duUQ+rqgjahgYLsNautmpI/byyZvkDDdRE/P
         anm3aXuaSwtvgdDKzjjHvejxRIR/4a6FCSdQ28xHbggTBWScvcd511FXfT4p3jLatNQy
         NR+ApVoG9Ahau5yn57prMSU93ZGfevgxftFIhcTJ0BUUg6DO7FEe+eZjkClgInWw/Hrp
         5ueHEzpPIVsJExIddCT7Mcy5TGpC3D2APCZ+AIl8hFTEwOEq8mXUkd1F6wL1S8fd/fQq
         Zr9d575hz7s3LJDaUG825RRsIVn2tR0uN6hbaZSmfSHdaylwd7TKg4K2G8VfeKzfqh34
         coIw==
X-Forwarded-Encrypted: i=1; AJvYcCXRNV7xd1kqhPfyUZfOikfSR4CuaYwlkSbIHROzmRzIh/tE7K5M+IRbEEAmM/ElbhMa3tCrGNfdBFROktc0QetIx1eLDOJ9+3pBmME6
X-Gm-Message-State: AOJu0YwHk4aWEW2xas6galOjo9F5HeiGaoIO8K/CKQfk3UHU1UCMlcge
	FpOE96TW7Hfi/W2PeL1iDyLEXqToP1nWrM26NcRgA54McW1EJOVe
X-Google-Smtp-Source: AGHT+IGPmM31pP4/EeJlrKrXYxjvW5slggKxA8CfUGLf9CovlmWxJIz6/FceDn5U368qBNv0iNC5FQ==
X-Received: by 2002:a17:902:e88f:b0:1dd:6965:5888 with SMTP id w15-20020a170902e88f00b001dd69655888mr10251961plg.47.1710594428433;
        Sat, 16 Mar 2024 06:07:08 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902a3c600b001dede7dd3c7sm5277814plb.111.2024.03.16.06.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Mar 2024 06:07:08 -0700 (PDT)
Message-ID: <402d1296-0a0c-4f85-a096-be7993869f94@gmail.com>
Date: Sat, 16 Mar 2024 18:36:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-8-ayushdevel1325@gmail.com>
 <8799b216-57a7-451b-80a3-3d4ae9693e0b@linaro.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <8799b216-57a7-451b-80a3-3d4ae9693e0b@linaro.org>
X-Rspamd-Queue-Id: 6D4303F368
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.53 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.94)[99.75%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.178:from];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: UHMDHUPS7HYQ7IJQ6E35MSJ7SGFHV3PE
X-Message-ID-Hash: UHMDHUPS7HYQ7IJQ6E35MSJ7SGFHV3PE
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UHMDHUPS7HYQ7IJQ6E35MSJ7SGFHV3PE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

 > Are you sure this fits in Linux coding style limit (not checkpatch 
limit, but the limit expressed by Linux coding style)?


Well, I am just using clang-format with column width of 100 instead of 
80. The docs now say 80 is prefered rather than mandatory, so well I was 
using 100 since I prefer that. If 80 is necessary or would make review 
easier than I can just switch to it.


I will remove serdev, pwm, clickID and send a new patch with the minimal 
driver and better commit messages as suggested with Vaishnav. It is 
important to have good support for mikroBUS boards without clickID as well.


Thanks for all your feedback and time.


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
