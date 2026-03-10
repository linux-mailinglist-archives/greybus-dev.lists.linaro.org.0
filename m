Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFvPI5KYsGkukgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:54 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 38027258D46
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2A039401F6
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:17:53 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	by lists.linaro.org (Postfix) with ESMTPS id 2AE943F6F0
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 21:52:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=lwOCuh10;
	spf=pass (lists.linaro.org: domain of dlechner@baylibre.com designates 209.85.167.175 as permitted sender) smtp.mailfrom=dlechner@baylibre.com;
	dmarc=none
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-466f59dbe4bso633010b6e.0
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773179551; x=1773784351; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=lwOCuh10PB9SsaHoaA9a/zbne6PxO91eruj1ESw/dls79o2k4yxrRSS+9aLoh1Qyij
         OWJ+F1gpiWNsGV5U7n16XkZ9Ur5O5lTpeHalQ5IytZiTBgHfMD+4GfiJ+WIgLr3DSwBJ
         A3nIPWv2dXcVTNspvQMjAppUh9pleOczhQ4g+2VhTEubChD7ktc6KK3B7hj1nxB5x0Ew
         bqSGfHn+V19bsQ6np+rPrCVYte7uwCADOvDgNt9bb2zYr5bjkcuLDYiGfiHtSXR0u++4
         cviHR0rieEfSpODHppNtA2Z1x4v//VBfkQ52Bq3Ixts258c50SNHlK0zlNb1fSi8xDJq
         +jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773179551; x=1773784351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrG0m0+wGAmylYP6HW5DIMPVkIxjVDO5lBH833IMH8c=;
        b=C2UnL1mf/fdNMQuR7mWYCW0GPKpjfd3VD7EYk+W3zaTwY4rtEUBP36XllwH1yUSzy1
         C+7oNjIPl5plnqSfszAa0J0pbXK7+K39w/UrFQ3+6CjevZyo2TZYOEUJobRojsFYtXlE
         5lC5n6i9XdttEpq9s5rMxD/tzkq5ExL4ti/8SLRUkfqk9M3zOlG/9Eo8Ui5UH+v01hWu
         kSewM1hSeHBPrsqKsJfXbURZ5x1LQK5GoSABIFCABMr5aRQcBzLd6m+AuVI8Crr9oLo+
         Le4fy0y/B257jp+M2oGM0HsZjFDmn8t5j3+cuk9waFh8T+UqyljmGqOyj3MgDZhKa/Ot
         p8Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWImE95QYjrZc62kJFqkxkZ6P6UuI1jC2TM9QwOnUTZtOL6NsUEs+/toKMYSgGCC/rADGUxcpZDDVAJTw==@lists.linaro.org
X-Gm-Message-State: AOJu0YxIgC9sPPSmhaHYXJ0wQxdaOXyOAuZMvq3RuT1/IuikFR0jhX1r
	1aOo9M9gtu9rjTWwxhysil+kZ4lmDv1mGGWt8e95v1Wqj3tprXqX5evUXIu3dexRMKg=
X-Gm-Gg: ATEYQzxqG/9JLguMRXF+WYe/b00TfVvPZooViSPGp6VTXVIiC7P+9ziLmtXi3+CCeGQ
	aJDHZ83OVB8UowStMo9hrOscbHxQzCsFXdLNGAlXLAcae5+JDIeDoTheBIMjpYaAUXumcRJj6bS
	puoNmZ/DM9wtDULtF2fx72zNG60tt99UNrlzH+HRUaputFTnYhtrN7BmCk2vMWG09QnK2ImT5Mf
	MmbD9mU8fpI7j9Mdm/zoMikTYxwPR6LxTijEVn1gY8vJyKx3rXJWk+BqMiMxeoxeAy7bYzD03WR
	ronCt0e382+xDCY2oAtDoIf5U0YN6AcK0xghJ/voA7pK49IgU+Z9P4WyKHNkV+XYaRng1konGFY
	5PSFIXDvyyXIkrm/6+HLVUqRXon1COVqm50dAjg6sZNpasL67cu+Xa9GrzTlRuriIuIiCm9kwVM
	t0e5DhJs49Q1OE/yplfIRyKbTdQn58LsE6t7kE6uGdRrh3eKG8XPS1HtGM9V9eBz4h0uAm1K5G/
	g==
X-Received: by 2002:a05:6808:1929:b0:466:ecc2:6f47 with SMTP id 5614622812f47-4673354b18amr144459b6e.31.1773179551449;
        Tue, 10 Mar 2026 14:52:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:78e2:51e2:14b8:2e10? ([2600:8803:e7e4:500:78e2:51e2:14b8:2e10])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm48179b6e.7.2026.03.10.14.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 14:52:30 -0700 (PDT)
Message-ID: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Date: Tue, 10 Mar 2026 16:52:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: dlechner@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: RKAWRWJL65IT3KKMOPOYH4VFROS2JB6R
X-Message-ID-Hash: RKAWRWJL65IT3KKMOPOYH4VFROS2JB6R
X-Mailman-Approved-At: Tue, 10 Mar 2026 22:17:16 +0000
CC: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RKAWRWJL65IT3KKMOPOYH4VFROS2JB6R/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 38027258D46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,mediatek.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.389];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,baylibre.com:mid]
X-Rspamd-Action: no action

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Hi all,
> 
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
> 
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
> 
> No functional changes are intended in this series.
> 
> Testing:
>   - Compiled with W=1
>   - Build-tested on i86_64
> 
> Based on:
>   <linux-v7.0-rc2>
> 
> Feel free to share your valuable input in context of the cleanup API.
> 
> Thanks,
> Sanjay Chitroda
> 
> Sanjay Chitroda (7):
>   staging: greybus: simplify cleanup using __free
>   iio: ssp_sensors: simplify cleanup using __free
>   iio: st_sensors: simplify cleanup using __free
>   media: mediatek: vcodec: simplify cleanup using __free
>   media: chips-media: coda: simplify cleanup using __free
>   media: allegro: simplify cleanup using __free
>   staging: rtl8723bs: simplify cleanup using __free

There is no reason to put patches from different subsystems
in the same series when there is no dependency between them.
It just make for more noise for everyone.

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
