Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 50859805F78
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Dec 2023 21:33:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 401FD40AE2
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Dec 2023 20:33:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by lists.linaro.org (Postfix) with ESMTPS id AAB8640AD4
	for <greybus-dev@lists.linaro.org>; Tue,  5 Dec 2023 20:33:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=kc4tYtqP;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.178 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d0b2752dc6so20190075ad.3
        for <greybus-dev@lists.linaro.org>; Tue, 05 Dec 2023 12:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701808384; x=1702413184; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1umsCfy/akzFPftCbPrbjo0m+EjeRCmtccRMiAQbUc=;
        b=kc4tYtqP3pVLRK3aTOTliUTB3Tl8TRlDy+DoKzzWVsqe6mnhCy03iOdwfmL54CYxea
         5h4R0Dq/boWckspoWsAvpjN4oxjorQyie4Dz2z9H+qTdsXZIGFrmJLswB2BVmmmfN7XC
         5pOHfD1xgZmh0sfz1mRMrREvdNK+fasBLSgdXILdvrEiTRKNgx1uHbPy3c5/j2DiUa3h
         PR84hGVldIhQbE4g7ymhbvimMnLZrCqon/0x4DE0pt3DAIE6sH2SNQ67evwe0tWiBvKe
         RYOwTTKP0Fof7PiTYu/mK+2F35HxTyQY9u2aBPQfWiQBBQ3KUq2uIXQi4M20uXi3RbpB
         tfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701808384; x=1702413184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N1umsCfy/akzFPftCbPrbjo0m+EjeRCmtccRMiAQbUc=;
        b=Rn20RlKkfUkJGWOvB5e4rOwYbm/E/2xYedRkB7OEn2suOKFjWU2UqYXjJyhQSwGwts
         XpgL6nc4pi+/L6N0/ixTdnMOB0uZoHTINmYyNL3hZ5QrQplcillVqYgF+kf8IFhpL0XK
         u+yU0oqsRWguGuLtXR22zK5PyVxsUpjhTYmPQxOWCzuci6b75bW8urGN79XYeIU7z/sG
         E8LzqW6XMSrO0hBFFUCHrIvwj+1eJpgC/Ih+fNmlatnWtclwe0KgyUlZByj3oeSafuEP
         JJqiLqV06TXRupgBDM7qs6MtWLnWLWgYDtIpmZXKliURKL2He0SVLNTehBCNscnCIZ5e
         NBfw==
X-Gm-Message-State: AOJu0Yw7xzsOJADU5sPmNacbPbkE0qcAnierbxYM9el5X4GIE3fLMksO
	z39d/KxYot1xTb0tVXWSBMY=
X-Google-Smtp-Source: AGHT+IFB1DcSVhkAgK4W14IJexGK19Q+ji8QfzeCUIKn0kJbfA8Hgns3wH9psDgw1bI+18FCDDRnJQ==
X-Received: by 2002:a17:902:d2c7:b0:1d0:c445:8014 with SMTP id n7-20020a170902d2c700b001d0c4458014mr2088785plc.76.1701808383705;
        Tue, 05 Dec 2023 12:33:03 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3e:53bf:50c7:2988:e019:4b97? ([2401:4900:1f3e:53bf:50c7:2988:e019:4b97])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001cca8a01e68sm10607813plo.278.2023.12.05.12.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 12:33:03 -0800 (PST)
Message-ID: <3cd7fc7d-075f-4945-b84d-7326e3c99553@gmail.com>
Date: Wed, 6 Dec 2023 02:02:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20231204131008.384583-1-ayushdevel1325@gmail.com>
 <ZW3ePt-c4Mu43DOV@hovoldconsulting.com>
 <7ead544b-9234-483f-aacb-55ed05b01fa3@gmail.com>
 <2023120515-mongrel-undertook-6e5a@gregkh>
 <4cafbb5a-8ecd-407e-81a0-76d6505d013b@gmail.com>
 <2023120616-rely-naturist-01db@gregkh>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023120616-rely-naturist-01db@gregkh>
X-Rspamd-Queue-Id: AAB8640AD4
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.08 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.99)[99.95%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.178:from];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MUKJ3NT2YFB44KWC5FJFAF6XCB7YU72V
X-Message-ID-Hash: MUKJ3NT2YFB44KWC5FJFAF6XCB7YU72V
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V3] greybus: gb-beagleplay: Ensure le for values in transport
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MUKJ3NT2YFB44KWC5FJFAF6XCB7YU72V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 12/6/23 01:15, Greg KH wrote:

> I'm confused, what exactly is needed here to be sent that isn't in the
> existing message definition.
>
> And as to your original statement, the protocol definition was not
> designed for any specific use case that would make IoT "special" here
> that I can see.  It was designed to provide a discoverable way to
> describe and control hardware on an unknown transport layer for devices
> that are not discoverable by definition (serial, i2c, etc.)
>
> The fact that we implemented this on both USB and unipro successfully
> provided that the transport layer for the data should be working and
> agnositic.
>
> thanks,
>
> greg k-h

So, the missing information is the AP cport which is sending the 
message/for which the message is intended. Each AP cport will be 
connected to a cport in some greybus node. For a simple case like USB, 
where AP can directly talk to the node, and we do not really need the 
cport information outside of kernel driver.

I think under normal circumstances, the kernel driver is supposed to 
directly communicate with the node. However, in beagle play, the subghz 
transport is only present in CC1352 coprocessor. This means CC1352 needs 
to act as the middle man between AP and node (aka perform the APBridge 
tasks). So it needs to maintain a way to keep track of all active 
greybus connections, and route the messages between AP and Node cports.

I am not quite sure where SVC is supposed to be in Linux kernel greybus 
setup. Since SVC needs to be able to detect module insertion/removal, it 
needs to be able to access the same transport as APBridge. Thus, CC1352 
(and gbridge in old setup) are responsible for both SVC and APBridge roles.

Simply put, if the kernel driver cannot directly connect to the node, 
the processor / network entity handling APBridge tasks will need to 
cport information. And it probably is good to make it possible to 
separate APBridge from AP in complex networks.

Feel free to ask questions if I was unclear regarding something. Also 
feel free to correct me if I got something wrong since I only started 
working on greybus this summer.

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
