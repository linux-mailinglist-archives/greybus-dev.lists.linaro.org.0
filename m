Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 802768702BB
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 14:30:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 948CC43F64
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 13:30:15 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	by lists.linaro.org (Postfix) with ESMTPS id 407A140CBC
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 13:30:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=YOyxAwl3;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.51 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7c76a566218so235916639f.2
        for <greybus-dev@lists.linaro.org>; Mon, 04 Mar 2024 05:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709559005; x=1710163805; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7SwXBaphoRUbVIp4iZ+2oYSdcUsTrLJSfY5VS/Whck=;
        b=YOyxAwl3bBRLcIlvWntuO0SldTO0s83Qr6YzY0GLNjND3IAVf5d5Iq4tGIAC7atRUJ
         6LrPGe0xn8TpTS0cOrqy+jal9b4gYDQg3NXtZyAuynWtGtretyCxlohOe3dmQ+mM8wbs
         nxQgEQoGNTTp7g3BtZykEISRfMyuzEzQZd6B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709559006; x=1710163806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7SwXBaphoRUbVIp4iZ+2oYSdcUsTrLJSfY5VS/Whck=;
        b=W1wnYWVZZX2unZUVRWevJgpxADIClgVUGiVYByPxzvRhvjrWX6ke6ihvAIdwvgbMRL
         CfHEiuqvQOTnlcDCDo+jwFSjezU58xIIHGkPwwvMJ5fYVLClJyj/uh63iSu684MA+lgG
         hWvTaj3e07U1tf6C64CZ1soTKY65cpkrMffs4pXxRzIKFHBKc0ApFYOtXAzaFl+4OhHo
         jIT7JOYEEXDPDHZpjvnEpgt0qrjUJD0uZ+xZd4AOiGB2K3rH+Ka1ogyt51cnHcVjDw25
         +wqEXQsfe97FFPvbyzkPRzCghTV785DL/mKkzBWg7BZkotlAK2LsAtzVJBJ4jgbspl+N
         QebQ==
X-Gm-Message-State: AOJu0YwMRk1wXoF8pVXWPcg3q8mj+XmmNnGrVNvUh7vkoEPmx9LSkA6C
	mhJw6YFc2DXTf5f7lHu9v5tkoq3sUkyCHkbuP4OoByaBEPt5woOm02UqVLdlKIMFpzNZNYkmZrg
	=
X-Google-Smtp-Source: AGHT+IHZPF+TKoIdFlXbZQRumkQ9OfKZzuKfCSc+Ixsdzf3z05qnw5Uj9WW5Md2UYTHTRGlwSbT0ZQ==
X-Received: by 2002:a05:6602:1ca:b0:7c8:4adf:cdf3 with SMTP id w10-20020a05660201ca00b007c84adfcdf3mr3814286iot.18.1709559005688;
        Mon, 04 Mar 2024 05:30:05 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e21-20020a6b6915000000b007c7e0e8edc1sm1180657ioc.52.2024.03.04.05.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 05:30:04 -0800 (PST)
Message-ID: <69825821-5b2c-44b1-b921-f077eedb3a71@ieee.org>
Date: Mon, 4 Mar 2024 07:30:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rui Miguel Silva <rmfrfs@gmail.com>,
 Mikhail Lobanov <m.lobanov@rosalinux.ru>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org> <m3o7bwlhgf.fsf@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <m3o7bwlhgf.fsf@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 407A140CBC
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.98 / 15.00];
	BAYES_HAM(-2.99)[99.96%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.51:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com,rosalinux.ru];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: LVVA4VHI3ZDHN6HIVXE3ZXKKZIZF2LMJ
X-Message-ID-Hash: LVVA4VHI3ZDHN6HIVXE3ZXKKZIZF2LMJ
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LVVA4VHI3ZDHN6HIVXE3ZXKKZIZF2LMJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/2/24 10:35 AM, Rui Miguel Silva wrote:
>> So anyway, I think this (and Dan's suggestion) should be
>> addressed, but your fix might not be correct.
>>
>> Rui, can you please shed some light on the situation?
> As we talked,  this email was sent at the same time as my replies to
> this thread and you think I addressed your concerns in that replies.
> If not, just go ahead and ask again.

Yes.

You said the intention was to return null if not found
(rather than "the passed-in value as default").  So that
bug should be fixed.  Dan says he'll re-send that.

Either way, even if it's practically impossible, the
get_channel_from_mode() *can* return NULL, therefore
__gb_lights_flash_brightness_set() should be fixed to
avoid dereferencing the return value in such a case.

					-Alex

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
