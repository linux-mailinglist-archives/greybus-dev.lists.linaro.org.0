Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5016BDC01
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 60DCE3E8AA
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	by lists.linaro.org (Postfix) with ESMTPS id 958C53EA3C
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:26:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=bje2PGni;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.46 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso8006482wmi.4
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 06:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678544784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=me1EJEGXaS0DFRZHEAYC72z0W2KEACpXBRzTLuD/pqM=;
        b=bje2PGnirIumpFcmHIdEnssR5Ih4SfMCJX+snPXZ5XOcQ0J6ePcFUqOfwHbesaCJYd
         06bZW2BNtDBkzA1cXGaLFQB6t5Fc7Aj4IuknfnT562lQ3x3n0lIRpDUlGyFXtPOSJF+V
         V+8kpPFTKqDnQMFouOlzxVfHZFyXMJpMQei0Iz99bSU64wf0f0Fx9FDp1mWt8OPGMJyp
         4HNiyvYlvfQ2Sk87rqeXyFNSUup7mvbNStVx74gG1px536ilCm9ytfc/stxRZwxoVIuf
         64uBvSsQkhBTxgchaWaRMDpZ1ixD9tzUpuCfvcvXQTogcttF+XW1LgR/wwT/MUcoDqIZ
         yuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678544784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me1EJEGXaS0DFRZHEAYC72z0W2KEACpXBRzTLuD/pqM=;
        b=vR77BCWrzaiNt6q8s2w8MqNEh6BLo73+FmMx97UhfwpSmXWV1g/UEU9EIBjKl6YxBX
         UwQ0L0lMmhmhZ1PPaou2/C3/zias7d2oN1zMXKowEitRE2i0pumPQ2o9DxsknuAO0Qlr
         8CMsst2oyejxO0BdlOM5I0ibEzrmTQYqac7UcCP2T6yCRKExTCaSuo+jwWyxWcoFxugw
         jRWMYvt2E6u1DoAlT42LpRHgL3SpyD/IGt1C7nrYxgpHvPRiLI9mMI/1wbvTtwCdhue+
         Zroxh+Jhd6V7N+Qqb8v8ZjcFLDv7yVzr37kdmBhrjFC+stNYvWwmeKc5DgIv+5g9wE2e
         NK5Q==
X-Gm-Message-State: AO0yUKVToIe/PlJcLvbPHDWsbL8VzLtOjPBJq6xTyf+++YwbysMVz68m
	Nt/GegKjFpVuxQzIFM0COTI=
X-Google-Smtp-Source: AK7set+Qh1IspVxGiRADjG20G93XsreuhL9Jl2qPNZj8A73Pq5+CfKKG+SMWT1Syv/ti3R41zOXDVQ==
X-Received: by 2002:a05:600c:35c4:b0:3e8:490b:e286 with SMTP id r4-20020a05600c35c400b003e8490be286mr5742615wmq.14.1678544784510;
        Sat, 11 Mar 2023 06:26:24 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600c451100b003dc434b39c7sm3644356wmo.0.2023.03.11.06.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:26:24 -0800 (PST)
Date: Sat, 11 Mar 2023 17:26:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Message-ID: <5f574998-3141-467c-8b45-291acd6fba8c@kili.mountain>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
 <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
 <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 958C53EA3C
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.01)[49.77%];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.46:from]
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GZB7XK4LZ5GFDJ3UOIFZMIY6UU6HTYY7
X-Message-ID-Hash: GZB7XK4LZ5GFDJ3UOIFZMIY6UU6HTYY7
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:50:29 +0000
CC: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GZB7XK4LZ5GFDJ3UOIFZMIY6UU6HTYY7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 11, 2023 at 05:23:11PM +0300, Dan Carpenter wrote:
> People are giving you feedback to help you and not because they are
                                                                  ^^^
I meant "care" not "are".

> about that particular line of code.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
