Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 73783655EFE
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Dec 2022 02:12:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 855A43EEBF
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Dec 2022 01:12:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	by lists.linaro.org (Postfix) with ESMTPS id 0E4E33E92E
	for <greybus-dev@lists.linaro.org>; Thu,  8 Dec 2022 11:37:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=hr9g9oA+;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.50 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so815057wms.0
        for <greybus-dev@lists.linaro.org>; Thu, 08 Dec 2022 03:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wp8pwOm51jJbX2U8CysByv6l44up2gkmggH0zmR59uU=;
        b=hr9g9oA+X3Q3043FEle4T9g+0A9Xy44HTORfEb/s5xPM1dHsqTmiUzWPCvcRsRkKb3
         F2LL52mTvFPafXt7UzioOfPl8ePCQb6JJbkokegpperyXh5Omlhht2+ikyG7P14drP4m
         XC9E7hn88V7iM/tzIrEv392Hxe//oNSq3ZmicDIr4qrDO86eFN1NgRV11q4ZHVMX02EH
         0IREJzJCeW4nQCO7EZDPVZXenNE9RiW1y7/181+lWDA+OzFRkhd9mtzPVcVbOUh9BUR5
         uUTADI8/P/tfMkKS7Hjsa5PtBJsVJtf2+/6c8DR8EaStTNMLNzJBHm7wp/3GFxT+X8pS
         7NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp8pwOm51jJbX2U8CysByv6l44up2gkmggH0zmR59uU=;
        b=6V6Zv/u8brBSmwF81xbKtskhdol/DmSPGz+BEYAks2/rdrxMIpbX7CHrGbMxgu3Mnz
         LZ6w2JiUu3OwlP/pxCtibz2ScKcE1CRWNqMnlaGF5TMDMBWJhrxW3ka7gUH3XCq2WbJJ
         TBneBIZTxUwntT0IGmJmXVxdYn5KFk5dlF2CUUbb78U2vz4RzSWgU1Di8jBqq84+48bg
         umgFXtetKxyAv6w9tpBy4Jrb++GI0d6/zECCqCHOAkX/mpFWLjhoUgF5fUmmIA2OEIWz
         4pz4SOLkxx6pLw8r1e5Hqk/29LLPhjFF0aujVF6fCtfzfRAvXpqgtqWtVaNDOoLmZuar
         DXLA==
X-Gm-Message-State: ANoB5pnz1hvGUBUxN/pCTy98HXdkA7Ppkw/Y1PniAkxPdVc7glDuf3uT
	lKVYA11zNF6uRPZwLaJb74I=
X-Google-Smtp-Source: AA0mqf6PbtX+3B/j+FAZZNk65Q8S/kUPfPrdRl7H0QGckaFLO8gzU3pBjZnRq2LRDdZLbvVAlfklEQ==
X-Received: by 2002:a1c:790a:0:b0:3cf:e137:b31d with SMTP id l10-20020a1c790a000000b003cfe137b31dmr58493535wme.205.1670499458979;
        Thu, 08 Dec 2022 03:37:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m38-20020a05600c3b2600b003b4935f04a4sm6757693wms.5.2022.12.08.03.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:37:38 -0800 (PST)
Date: Thu, 8 Dec 2022 14:37:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
Message-ID: <Y5HMf2PsvHVKmJ0z@kadam>
References: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
X-Rspamd-Queue-Id: 0E4E33E92E
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	RCVD_IN_DNSWL_HI(-0.50)[209.85.128.50:from];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.50:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WDEBH2KSFIJ6JUZIA3AVLVW5GAHIORVG
X-Message-ID-Hash: WDEBH2KSFIJ6JUZIA3AVLVW5GAHIORVG
X-Mailman-Approved-At: Mon, 26 Dec 2022 01:11:57 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 RESEND] Staging: greybus: camera: fixed brace coding-style and indentation issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WDEBH2KSFIJ6JUZIA3AVLVW5GAHIORVG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 08, 2022 at 04:59:46PM +0530, Abhirup Deb wrote:
> Fixes checkpatch.pl warnings for missing braces in &gcam. Fixes
> indentation issues for functions, following the Linux Coding Style.
> 
> Signed-off-by: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
> ---

I notice as well that this is a v2 patch.  You need to add an explanation
under the --- for why.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
