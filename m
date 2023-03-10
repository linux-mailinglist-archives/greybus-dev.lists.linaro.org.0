Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7518F6B5579
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:18:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8F5ED3F4EC
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:18:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	by lists.linaro.org (Postfix) with ESMTPS id DD5B63F056
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 22:39:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=oXFqjObq;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.221.52 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id q16so6404834wrw.2
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 14:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678487964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5PuvKOvfLUjyVO4mPIX/XjsIPQ+ajMnbP2SJqNrL1cI=;
        b=oXFqjObqygxkHRfqqAMKRIVwozsa0l3DRG6a6G7slqeC+CHe384vkDLPFFrgbGeydG
         kOyWZjR1179dMQJLO+/tAshkv3m/fLIQ9GVzY+IpruvMWcjLnEFkfdIjGzLuE3mCpzMl
         pPcnQljNsdvoaKgdB+l6cu1hkxG9Itfx6XfTpL8ZJAzK+z6tsEy4BMFChg/kwBhWE2PD
         VXznHjVeZosZojk7dMs3t3JzdXmlhdhS3gtM8Uht7t5EjvAM2UYmD2GidzVMbs6gI2A6
         h86Y9mL27HXXz9sUl3QlbAPk4Gq8EuD74Mu7I5Ox+Z05pfIyMha48spVo9zCnOxh5f0B
         dosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PuvKOvfLUjyVO4mPIX/XjsIPQ+ajMnbP2SJqNrL1cI=;
        b=omgeap/91L1xwLcT58YIqTbtD700LDEqG0TO/LWrFGFKhINoi7QO/izy95rTzjnekQ
         WyAqF2NGCRi5XLSqzIy8hR+f1IYkhcbu5GOFS7J7fqManFdo3a85qRQoiJoBiYt0zhBb
         rkwTVLyxXqX5/vgX2azL0IF/vdeVcASZji05c1ZFl+kCFcGZw5rsG5tW/OaasjxyeVgJ
         1Y5b5PiTO2u8OCo86VepqSZnSBqT/ALQClM6n66j5tSXx6Fqmbm2eFzvwQ4KwvzW3Nkz
         nr987YYRes/yyJ/YBvkmhSnXFFoOAu0r3loF+SITugSoQLFmORn3nFf8CsCqAVajwAR0
         N4fQ==
X-Gm-Message-State: AO0yUKWsHLJaOZ3guGaXA5zRBMRDW2lg1JiNQj52YJkLR9MSDclx+2ZD
	BIMxoHYRjpoQY+WqK7yxyoE=
X-Google-Smtp-Source: AK7set/7u/SY1mUQXvz+1eJcT8g0IyPHytdodVx6/Y9NnoSmRa1Uw6b/LVVnXac95BUA3XmVBqxmqQ==
X-Received: by 2002:a5d:474b:0:b0:2c5:a38f:ca3a with SMTP id o11-20020a5d474b000000b002c5a38fca3amr2557906wrs.10.1678487963664;
        Fri, 10 Mar 2023 14:39:23 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id f16-20020a7bcd10000000b003dfe5190376sm1095707wmj.35.2023.03.10.14.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:39:23 -0800 (PST)
Date: Sat, 11 Mar 2023 03:39:20 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>, julia.lawall@inria.fr, drv@mailo.com
Message-ID: <ZAuxmGmVQMSwig44@khadija-virtual-machine>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
 <eb7475da-7548-4820-a2b6-ff0f6cf4be71@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb7475da-7548-4820-a2b6-ff0f6cf4be71@kili.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DD5B63F056
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.91 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.09)[64.73%];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.52:from];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,inria.fr,mailo.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OS45R3JTUBGFVHGEWXFIZYLHNVOSJ6SO
X-Message-ID-Hash: OS45R3JTUBGFVHGEWXFIZYLHNVOSJ6SO
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:53 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix exceeds line length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OS45R3JTUBGFVHGEWXFIZYLHNVOSJ6SO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey! 
Sorry, I am unable to understand this enough. Since it is mentioned that
the patch raises another checkpatch warning, should I stop working on
this patch and look for some other files? Kindly let me know.

As for now, I have submitted another revision of this patch.
Thank you.
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
