Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMbhKHlLymmb7QUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 12:07:53 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 86870358DF1
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 12:07:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 67B3140303
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 10:07:52 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by lists.linaro.org (Postfix) with ESMTPS id 1CC7A3F814
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 09:35:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jfErJ1Ky;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.208.173 as permitted sender) smtp.mailfrom=error27@gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a01c80c34so37785791fa.0
        for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863326; x=1775468126; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ipfpOKX2JiHD7zjNhC6JygPwjUI88vtU81EfO4uTgks=;
        b=jfErJ1KyIeKBE1YFDm+NqOsDsSK7c2XVdhd1hNVgDBxjipJohGUT1RcI++goO82rDr
         8Z6RhmzeYYuw3aZh/Gb5oCx6g2qEyUNyu1RJJfdudvfSH4q3uG8aDZT3GbYlJslo/huI
         w0Pgp64yeNDdXYaWi95qZ2E1EDqkMsEyM29I580zjPdy8OlD7AoSXxWkVa7mFL5f7/9a
         azgt7TFgSgovL9gBbh4mf8ZvOIuIs8SyQtl+P7evyI72dEik29hhvcmNdYUSObBhu8J2
         zVHWbJz84RQtiIZkwZoGs0mUs19HnddepIHEF+X+Rkg50Kr2HVcJayJ2ACVVYAE2O71x
         6dSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863326; x=1775468126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipfpOKX2JiHD7zjNhC6JygPwjUI88vtU81EfO4uTgks=;
        b=nZCtNRXaO/nKTN+W2HAd6uYMYukfRSA58gUB2QJEmXcexeloxTA48KCcerhUp8bjDd
         0DzYzpItDZf8+U/8ShPGojnbC0EHh4HRrQXOFdUB9vHdy5UTUM259F8UwmMqlHp93MUR
         TcGUSm7qmlz4ZVyt4XAJuaQvwnHSVlyiaXt3w1MM7bi8JKRox+SQyEo0ZoUOOyat0sCI
         dp8N9BLyUEErX4yVVTvgCmy8cXRnKnpvi2XGy2yOMe2qNCcu3lYWs0bSq3w/gMiuKNtW
         BNEVQLbARlyaBSsRwjj6aVeYl8JmTdP7lM7AIKBTDvU0qt/png02xvdYJIkwZQnDgTpE
         5s4g==
X-Forwarded-Encrypted: i=1; AJvYcCXVE1kK6TeshYOtK6YUdFKJ4A6G764l0iQPB14TvW7ARWNvIx/bJrWG4KdEjfkwrGK3x8hhZOhwJwPLOg==@lists.linaro.org
X-Gm-Message-State: AOJu0YyXT2qVXybz2k0xnHem7+W3LdSi3cpz6+hF59QUyaskcqkJn5q4
	6ZPcu4ggKvpJVjA6sc76MaPbOrzg/1xOFE9jaaJQUXe6zH635/DN+1Ly
X-Gm-Gg: ATEYQzykQtqJ/ldx4Z9yqZRx0RvL8UWiA6aBhPTAdQckqH2RCWp6VabO7wemfWT2gaP
	OGTg6sZg4X6oeud1W20Tf3tRo2h8NXr8bTNfZXAIBNRhJ4am2R7KjFVxtxCjEcKwIKhjcxr5EHg
	ZONTW/IXmyi6cgqaFQvb4757GXmKpmzQJVun4HftjAZ3deA9gGViiQfEsAQD3LhytsKLSTIk1og
	c0DRMskzHvkf1cE2ZD0D3Gt8k9HnLLpqZhq7EmJ04oDF+RzzLURrlnK6h5gZI6O49Hr4jU2MhLR
	nqCyLNk62G+wG0MlzK8oPdJA9Hq+KZpyhQvR1mvAGPj3FaAtwLhW3PU+N6VCAZX1ldDaDFMy7Jp
	uKgb2vmCmdRXpA6d4wC/TsdH0XBymGG4BQ+sfk2+dVh5fGVbH8KEKcSgbpw1u7bl7YknsTYRvIg
	s127j0v+2XD5S3hZxhEXo=
X-Received: by 2002:ac2:4e01:0:b0:5a2:b40b:3f76 with SMTP id 2adb3069b0e04-5a2b40b3ff5mr1554208e87.21.1774863325706;
        Mon, 30 Mar 2026 02:35:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm1564928e87.19.2026.03.30.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hadi Chokr <hadichokr@icloud.com>
Message-ID: <acoi3_Pv8x4-FeZC@stanley.mountain>
References: <20260328044527.10489-1-shivgupta751157@gmail.com>
 <2026032850-riverbed-distant-f96b@gregkh>
 <6c54c6bc-7c1a-4a3b-8135-eb9c5925c9a8@icloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c54c6bc-7c1a-4a3b-8135-eb9c5925c9a8@icloud.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HVJVI6YA3GFKXEFOEHKYJD2ATAATL3QP
X-Message-ID-Hash: HVJVI6YA3GFKXEFOEHKYJD2ATAATL3QP
X-Mailman-Approved-At: Mon, 30 Mar 2026 10:07:45 +0000
CC: Shivam Gupta <shivgupta751157@gmail.com>, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_manager: Add missing newline to sysfs_emit outputs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HVJVI6YA3GFKXEFOEHKYJD2ATAATL3QP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[icloud.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.021];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,stanley.mountain:mid,linaro.org:email]
X-Rspamd-Queue-Id: 86870358DF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "don't break user space" rule is more important than style
guidelines.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
