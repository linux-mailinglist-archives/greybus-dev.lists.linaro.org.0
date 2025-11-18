Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 14610C67FDE
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 08:37:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E22E63F902
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 07:37:02 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	by lists.linaro.org (Postfix) with ESMTPS id 5EF723F7F2
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 07:36:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=TbMcSykt;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.218.54 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73b24f1784so192896966b.0
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 23:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763451415; x=1764056215; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rb1AZdrI6VjKLUj+2F+eU7kfRCL6K9PQeZlP12b9JH8=;
        b=TbMcSykt90WsdmVzpG5YdXArShD2WIHzbudSQGSyDSgYsTLdXnlb36oGk4WXd7Je1F
         MwbjMVhLNtwWhgf31mlCkt1MlCa2MgjPXr84+3fF9VshoSC1oLlPPSptNVMhAfp/xaBg
         5GJhNASKMZeBGllm7JxsCczpFJ+DWuyKcVG2OD1gBcFS8Nkf09/F4IwqMYh927E5frlH
         Oawzvptb8p1DwCXKJNt0FAzj7JDKwfs0Y8nTw6RUKSWK64KJbDGlnU8XaSu2+o3OMu99
         xQYU6jebVXecWlLo2c6aKpM3dJgDDiEe1j43N6zNd57udxgK3L0B/4lVaDlITVvPyxCW
         YUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763451415; x=1764056215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rb1AZdrI6VjKLUj+2F+eU7kfRCL6K9PQeZlP12b9JH8=;
        b=Z0+bLJa+hEpIRfiuJuhFZOUjD4uMZAvpZD1DalqYqe82rNMc8tFzpTZYASI2BKjNv0
         56FScC6zePY32r5wKNsMY4rgrgg+M1LbiSUmhyTLiZRdcdlMXsLEsZEKTRHWOIp5nwlR
         AocKfvyGDQrsDF3q5/So2WXgST9F/VYzIl0/S7jTR0Yn2nQGdDtmLGFyrV+8XacnhKiF
         uxNK5yC31+aX/8UWnGFr8bM2cw8ybBjs1XFaL6yVBwTnWhqFTkLb8FlvOuCgK2g9qaro
         3Eq1GNdiuWsAjDaEZ6AA0E1FP+jw0n2EBUNtjxq7/8O9swtFATqnLMP6WnmbFHaq6STc
         mBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzFTTJl4WGnu64Au9SFDKnnFnGsZWfutJ12FU8yZ4aSG1946E31UjfIhlVqgwdZhFuWyDzA2HXXHOVkQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxJZl8CSOTPZKGDVONot/gBuPi6hKj6f0RYCxcco1ypEdqtyRoG
	grTpnG90/H2ErEzzfFhZAlW6J0yJARlpBUX2Plu5PuMwPPuHSC28mxzu5Yf8IiwSWvPVdw==
X-Gm-Gg: ASbGncuc0yyD0+H2eNs1ucGAcdeG41g1ksz/8LsCD05hqaw7GqK53NNdLGrzd+i9qr9
	F4mJ/32rsW4KBIv1N0xldITDMNL6od0oebWfJ4nG4I2pOAeuOGdJ58Z3T8is/Nz1aIAOiau8GNZ
	W01QnWJqu5pJmEpmPuyPnBhA6GuuyUeJXDu1qMSpGyIsneUIzcxgNcGxsSQF6OSiW3mVW+OGWSg
	lRfAU+f0I4NuuMOOBwMxz/IzdNFRZOlPDcaH6gNAj6ao5KFxKxar4e8LMyTB4r0lp4p/anXY1n/
	jlP3nUUqzWdRTC4t+MBzHstBy4qMLutYAoGy+IkiElck2MkYO4jm++oizeW0yrchVdCtBIrPc7H
	+P31P5OFv3zgiFQtWoxEZ+BvIIl0hcD85qD8N/2pyheU3iWJsRrLBi76mSiUkjjf//PxUsTi206
	FaPLSgAw==
X-Google-Smtp-Source: AGHT+IG0FpjWmmxcQYJpVKcXJx06Pdk1OMq8ApJhUZmh+cOAdGtHz/5esIfHPFyf7pTZjPJESFRRRw==
X-Received: by 2002:a17:907:5ca:b0:b73:2e54:a002 with SMTP id a640c23a62f3a-b75a0a05e00mr294145366b.15.1763451415325;
        Mon, 17 Nov 2025 23:36:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6433a497ffdsm12125067a12.21.2025.11.17.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:36:54 -0800 (PST)
Date: Tue, 18 Nov 2025 10:36:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Message-ID: <aRwiEnEx4gX90eVh@stanley.mountain>
References: <20251117065003.7453-1-dharanitharan725@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117065003.7453-1-dharanitharan725@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.28 / 15.00];
	BAYES_HAM(-1.18)[88.96%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.54:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,linaro.org:from_smtp,linaro.org:from_mime,mail-ej1-f54.google.com:rdns,mail-ej1-f54.google.com:helo];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[209.85.218.54:from,196.207.164.177:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5EF723F7F2
X-Spamd-Bar: --
Message-ID-Hash: KUNJERLNDSUHP32G256RT3SQ7GLJGR3L
X-Message-ID-Hash: KUNJERLNDSUHP32G256RT3SQ7GLJGR3L
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KUNJERLNDSUHP32G256RT3SQ7GLJGR3L/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 06:50:03AM +0000, Dharanitharan R wrote:
> The sample userspace firmware-management tool uses strncpy() to copy
> firmware tags. strncpy() does not guarantee null-termination and can
> leave buffers unterminated. For userspace code, strlcpy() is the
> recommended safe alternative.
> 
> Replace all strncpy() calls with strlcpy().

Don't use strlcpy().  Either use strscpy() or strscpy_pad() as
appropriate.  I wrote a blog about this which may be useful.

https://staticthinking.wordpress.com/2023/10/30/strcpy-strncpy-strlcpy-and-strscpy/

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
