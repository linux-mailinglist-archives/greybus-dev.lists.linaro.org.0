Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6FC655EFD
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Dec 2022 02:12:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A9A883EF47
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Dec 2022 01:12:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id D72103E826
	for <greybus-dev@lists.linaro.org>; Thu,  8 Dec 2022 11:33:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b="HjNpis7/";
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.45 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so807504wms.0
        for <greybus-dev@lists.linaro.org>; Thu, 08 Dec 2022 03:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gyePz0ceQs7OoaxMHF/kKC6cWki4Kwyl7phO32bdEmc=;
        b=HjNpis7/M9qlQGmmb6AvPNbsbhnPigEf1y0ufykE7eEwtpoyGUv/EgNWnhDyyMvs8N
         whrgryNZoTPPEzgOxn8I7eGtvt0i3WWW+yoMsfl+bCdBHnTjbYZTmVI1aRsD8XUwtAKW
         EDWoyzBDyMV/f4qd5H5/12kdWVO+6toaqTmYJ15TWaCh1fSYqCwWLwPyyvmr4/2rUiwk
         M3+mBgwxDjGOCQJiswaPpr2cCt4Y7KNK/XgNEaia7cZ2kfVbaS2kp6xdLY6jn+Tslf9f
         gkQfKFXBfmXBfR8V13p13WX/mwusbJc6s2MMZ61yVOVEI7zvZV1C+r7ZagmaTZpGv5LS
         0QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyePz0ceQs7OoaxMHF/kKC6cWki4Kwyl7phO32bdEmc=;
        b=zQCtKuTaSm//Uexlgr7alhQlVrAwuejjdLe57unFSKOe6ctQNo/6o7qAKKTHa6MQrW
         3KR61JPzI3kTqVbyasPezELQbRY+3SP7tbo4x7qqG46xIH8Ngrig97C4jfw0KU89E5vJ
         K3jaXOGumZ4rU2+CqQoZ7VDhSHGu5untV/v6zgMaZQSr8C4cUAkuTmeR+T59tzpsm6jS
         g6Q1aG7WjdPPmxCCRWKGXAF/WkUXyoMfCDFvuuO7rA/eXvBdtPAOzqLlGf6suZ/eGhp4
         3zvkZtfe0ygJk7KI2OhBVyCLHZCFfRFYVrcNQXyik3hq+7t87dGpj4dSP0Js/GFMwEKU
         ekAQ==
X-Gm-Message-State: ANoB5plS5ihjjVMe22DaxC7oK+iHatAFeTEcs4hi7Bks6/Txhdl2Kgfs
	ogpCmJE09Pv5iaHDo2xXwvw=
X-Google-Smtp-Source: AA0mqf4cD9rhikrA6MLNsQ/UECoZtltssHkhnYE3CHNWHQLvysj514I/ukiGkCTge9MH4Zniw4CbYA==
X-Received: by 2002:a05:600c:548b:b0:3cf:b0e4:30d9 with SMTP id iv11-20020a05600c548b00b003cfb0e430d9mr60584027wmb.66.1670499211799;
        Thu, 08 Dec 2022 03:33:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ck14-20020a5d5e8e000000b0023677e1157fsm10731915wrb.56.2022.12.08.03.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:33:31 -0800 (PST)
Date: Thu, 8 Dec 2022 14:33:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
Message-ID: <Y5HLh1r3R2bULsRj@kadam>
References: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
X-Rspamd-Queue-Id: D72103E826
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.11 / 15.00];
	REPLY(-4.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[209.85.128.45:from];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	BAYES_HAM(-0.11)[65.76%];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.45:from];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
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
Message-ID-Hash: YBZFXYPNLUAL677I74KAVEEX4NFVVYRT
X-Message-ID-Hash: YBZFXYPNLUAL677I74KAVEEX4NFVVYRT
X-Mailman-Approved-At: Mon, 26 Dec 2022 01:11:57 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 RESEND] Staging: greybus: camera: fixed brace coding-style and indentation issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YBZFXYPNLUAL677I74KAVEEX4NFVVYRT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's hard to ignore checkpatch but I feel like the new code is worse
than the original.  Let's ignore checkpatch on this.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
