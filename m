Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 442F57F6641
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:29:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4816240B56
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:29:42 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	by lists.linaro.org (Postfix) with ESMTPS id 139143EF5A
	for <greybus-dev@lists.linaro.org>; Thu, 23 Nov 2023 18:29:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=CUslSZMS;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.171 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-35b8fc2115bso2743405ab.0
        for <greybus-dev@lists.linaro.org>; Thu, 23 Nov 2023 10:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1700764174; x=1701368974; darn=lists.linaro.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbJ3xbRY59yxWggiUbXA32Y0kAOJ1bl2Hda/uruz+nM=;
        b=CUslSZMS3rKGGlyohxme5OhQtqJEyzyedbxU3Nhj++U/9280qAZoFQT9t9rC6ofSX7
         vbNxZp1Q0mxq7CxJWpsW3erSEugOFfb4rNBOsJVg2euP/i2BpF63Jso0BNNdMo9iUzB5
         q41ltxpuo9+HYHlefGb2BJjdtEKzSdWmTwBuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764174; x=1701368974;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbJ3xbRY59yxWggiUbXA32Y0kAOJ1bl2Hda/uruz+nM=;
        b=QFlNWqJ08t91qwv/F05LWJh0V6o0PlXM/+UzS/R/2OAGVTfwfIWK9SM/a3DnXOdwy/
         WBxaenewZn27EsFyKEWBUwcnKQVC0kTp8/07u1V9FCWeUmifZUFLIgMEwcVHlbV5ddpZ
         lj/bH615Y1OMdm1+fcexef19f1nVqh9qwf0U9OoXOvb24PX0phxEH9m+KVmFVI3rahRt
         N7MCskn4483IIYJfkqLAZymmhs0JKVSil5N7qDy/tcb9Hb2J9l3h/OykCdhtsU/HdMzH
         wcACrzwafBcBXX/bogqs/2yEYwlywGzRcQhuazl2oDM1JFS+iX52cPltvl2F/qIaIJiR
         kaTA==
X-Gm-Message-State: AOJu0YyQi4+zwfb6SYMPzlvkTcKtpMoTC+CcMFbQ9rA5W0IaAlN4liNF
	ymurQ3PFzCScDZr0ZO2V/SPfUP0xD9Rqn91ikROxff1a7usNhoH2LOfHC77X8C5HSIhb8smFmLy
	NU7vaGl3dSA9Jlb4ZLE3X+VL/xx4Lu+gscXMY7sfsSFtgfMYa7ULnM381SRyH8VvMxrxpMQqi/m
	c=
X-Google-Smtp-Source: AGHT+IExnAIIykeDqednYFVI+x20pS3iehS382dISwc8uBRTzBi9NuL5A1YJFtDMZ68NVIGB6jCuNg==
X-Received: by 2002:a05:6e02:170a:b0:35a:e585:4275 with SMTP id u10-20020a056e02170a00b0035ae5854275mr6600ill.7.1700764174098;
        Thu, 23 Nov 2023 10:29:34 -0800 (PST)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id j15-20020a056e02220f00b0034f7e365f97sm521976ilf.2.2023.11.23.10.29.33
        for <greybus-dev@lists.linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 10:29:33 -0800 (PST)
Message-ID: <9a0c5a15-ccbe-49ea-909f-d4f3e43e058f@ieee.org>
Date: Thu, 23 Nov 2023 12:29:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: greybus-dev@lists.linaro.org
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
X-Rspamd-Queue-Id: 139143EF5A
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.32 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	BAYES_HAM(-0.33)[75.76%];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.171:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ZJZ5QZ3YYKGSFLOAES4F6UU5IO7XDLDN
X-Message-ID-Hash: ZJZ5QZ3YYKGSFLOAES4F6UU5IO7XDLDN
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Old messages
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZJZ5QZ3YYKGSFLOAES4F6UU5IO7XDLDN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

I just reviewed the list of held messages (many spam, but
some were not) and released legitimate ones for the first
time in a while.  Sorry that these messages are just showing
up now...

					-Alex
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
